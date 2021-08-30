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
            let weatherJsonString = try YumemiWeather.fetchWeather("{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }")
            output?.outputWeather(jsonString: weatherJsonString)
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
}
