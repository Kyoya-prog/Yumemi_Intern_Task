import Foundation
import UIKit

protocol WeatherView: AnyObject {
    /// 天気画像を表示する
    /// - parameter weather:Weather型の天気情報
    func showWeather(_ weather: Weather)
}

protocol WeatherPresentation: AnyObject {
    /// 天気を取得する
    func fetchWeather()
}

protocol WeatherPresentationOutput: AnyObject {
    /// 取得した天気を出力する
    /// - parameter weatherString;天気を表す文字列
    func outputWeather(weatherString: String)
}

protocol WeatherModelProtocol: AnyObject {
    /// 天気を取得する
    func fetchWeather()
}
