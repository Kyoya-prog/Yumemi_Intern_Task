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
            let model = try convert(with: jsonString)
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
        } catch let error as DecodingError {
            // APIの仕様変更などでdecodeに失敗した時は気づけるようにassertionFailureは投げておき、unknownErrorとして通知する
            assertionFailure("decode failed : \(error.localizedDescription)")
            let weatherError: WeatherError = .unknownError
            output?.outputWeatherError(weatherError)
        } catch {
            assertionFailure("unexpected error occured : \(error.localizedDescription)")
            let weatherError: WeatherError = .unknownError
            output?.outputWeatherError(weatherError)
        }
    }

    private func convert(with jsonString: String)throws -> Weather {
        let data = Data(jsonString.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let model = try decoder.decode(Weather.self, from: data)
        return model
    }
}
