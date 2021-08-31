import Foundation
import UIKit

protocol WeatherView: AnyObject {
    /// 天気画像を表示する
    /// - parameter weather:天気
    func showWeather(_ weather: Weather)

    /// エラーを表示させる
    /// - parameter message:エラーメッセージ
    func showError(withMesssage message: String)
}

protocol WeatherPresentation: AnyObject {
    /// 天気を取得する
    func fetchWeather()
}

protocol WeatherPresentationOutput: AnyObject {
    /// 取得した天気を出力する
    /// - parameter model:リクエストした天気情報のレスポンス
    func outputWeather(_ model: Weather)

    /// エラーを出力する
    /// - parameter error:エラー
    func outputWeatherError(_ error: WeatherError)
}

protocol WeatherModelProtocol: AnyObject {
    /// 天気を取得する
    func fetchWeather()
}
