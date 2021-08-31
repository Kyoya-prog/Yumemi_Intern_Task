import Foundation
import YumemiWeather

class WeatherModel: WeatherModelProtocol {
    var output: WeatherPresentationOutput?

    init(output: WeatherPresentationOutput) {
        self.output = output
    }

    // MARK: WeatherModelProtocol

    func fetchWeather() {
        let requestJSONString = "{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }"
        do {
            let jsonString = try YumemiWeather.fetchWeather(requestJSONString)
            let response = convertJSONStringToResponse(jsonString: jsonString)
            output?.outputWeather(response)
        } catch let error as YumemiWeatherError {
            let weatherError: WeatherError
            switch error {
            case .invalidParameterError:
                weatherError = .invalidParameterError

            case .unknownError:
                weatherError = .unknownError
            }
            output?.outputWeatherError(weatherError)
        } catch {
            assertionFailure("unexpected error occured : \(error.localizedDescription)")
            let weatherError: WeatherError = .unknownError
            output?.outputWeatherError(weatherError)
        }
    }

    private func convertJSONStringToResponse(jsonString: String) -> WeatherResponse {
        let data = Data(jsonString.utf8)
        let weatherDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let maxTemp = weatherDictionary?["max_temp"] as? Int,
              let minTemp = weatherDictionary?["min_temp"] as? Int,
              let weatherString = weatherDictionary?["weather"] as? String,
              let dateString = weatherDictionary?["date"] as? String else {
            fatalError("converting is failed")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("dateFormatting is failed")
        }

        guard let weather = Weather(rawValue: weatherString) else {
            fatalError("unexpecetd Weather String \(weatherString)")
        }

        return .init(weather: weather, maxTemperature: maxTemp, minTemperature: minTemp, date: date)
    }
}
