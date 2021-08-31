import Foundation
import UIKit
import enum YumemiWeather.YumemiWeatherError

enum WeatherError {
    case invalidParameterError
    case unknownError
}

extension WeatherError {
    var errorMessage: String {
        switch self {
        case .invalidParameterError:
            return "リクエストが不正です"
        case .unknownError:
            return "予期せぬエラーが発生しました"
        }
    }
}
