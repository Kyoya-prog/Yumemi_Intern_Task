import Foundation
import YumemiWeather

class WeatherModel: WeatherModelProtocol {
    var output: WeatherPresentationOutput?

    init(output: WeatherPresentationOutput) {
        self.output = output
    }

    // MARK: WeatherModelProtocol

    func fetchWeather() {
        do {
            let weatherDataString = try YumemiWeather.fetchWeather("{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }")
            let data = Data(weatherDataString.utf8)
            let weatherInfo = convertDataToDictionary(data: data)
            output?.outputWeather(weatherString: "")
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
            fatalError("unexpected error occured : \(error.localizedDescription)")
        }
    }
    
    private func convertDataToDictionary(data:Data)->[String:Any]?{
        let weatherDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        return weatherDictionary
    }
}
