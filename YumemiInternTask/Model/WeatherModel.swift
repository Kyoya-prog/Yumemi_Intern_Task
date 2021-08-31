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
            let weatherString = try YumemiWeather.fetchWeather(at: "")
            output?.outputWeather(weatherString: weatherString)
        } catch let error as YumemiWeatherError {
            var weatherError: WeatherError
            switch error {
            case .invalidParameterError:
                weatherError = .invalidParameterError

            case .unknownError:
                weatherError = .unknownError
            }
            output?.outputWeatherError(error: weatherError)
        } catch {
            fatalError("unexpected error occured : \(error.localizedDescription)")
        }
    }
}
