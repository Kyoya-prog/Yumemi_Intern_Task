import Foundation

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
