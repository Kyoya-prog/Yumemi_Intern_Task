protocol AppError: Error {
    var errorMessage: String { get }
}

enum WeatherError: AppError {
    case invalidParameterError
    case unknownError

    var errorMessage: String {
        switch self {
        case .invalidParameterError:
            return "リクエストが不正です"
        case .unknownError:
            return "予期せぬエラーが発生しました"
        }
    }
}
