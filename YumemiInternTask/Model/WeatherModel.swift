import Foundation
import YumemiWeather

class WeatherModel: WeatherModelProtocol {
    var output: WeatherPresentationOutput?

    init(output: WeatherPresentationOutput) {
        self.output = output
    }

    // MARK: WeatherModelProtocol

    func fetchWeather() {
        let requestJSONString = #"{"area": "tokyo", "date": "2020-04-01T12:00:00+09:00" }"#
        do {
            let jsonString = try YumemiWeather.fetchWeather(requestJSONString)
            let model = try convertJSONStringToModel(with: jsonString)
            output?.outputWeather(model)
        } catch let error as YumemiWeatherError {
            let weatherError: WeatherError
            switch error {
            case .invalidParameterError:
                weatherError = .invalidParameterError

            case .unknownError:
                weatherError = .unknownError
            }
            output?.outputWeatherError(weatherError)
        } catch let error as ConvertError {
            output?.outputWeatherError(error)
        } catch {
            assertionFailure("unexpected error occured : \(error.localizedDescription)")
            let weatherError: WeatherError = .unknownError
            output?.outputWeatherError(weatherError)
        }
    }

    private func convertJSONStringToModel(with jsonString: String)throws -> Weather {
        let data = Data(jsonString.utf8)
        let weatherDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let maxTemp = weatherDictionary?["ax_temp"] as? Int,
              let minTemp = weatherDictionary?["min_temp"] as? Int,
              let weatherString = weatherDictionary?["weather"] as? String,
              let dateString = weatherDictionary?["date"] as? String else {
            throw ConvertError.jsonConversionError
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: dateString) else {
            throw ConvertError.dateFormattingError
        }

        guard let weather = WeatherType(rawValue: weatherString) else {
            throw ConvertError.unexpectedResponseError
        }

        return .init(weather: weather, maxTemperature: maxTemp, minTemperature: minTemp, date: date)
    }
}
