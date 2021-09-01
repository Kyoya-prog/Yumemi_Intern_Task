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

enum ConvertError: AppError {
    case jsonConversionError
    // ユーザーに細かいエラーを見せる必要はないので、共通文言をメッセージとして表示する
    var errorMessage: String {
        "予期せぬエラーが発生しました"
    }
}
