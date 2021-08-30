import Foundation
import UIKit

protocol WeatherView:AnyObject{
    /// 天気画像を表示する
    /// - parameter image:表示する画像
    func showWeatherImage(image:UIImage)
}

protocol WeatherPresentation:AnyObject{
    /// 天気を取得する
    func fetchWeather()
}

protocol WeatherModelOutput:AnyObject{
    /// 取得した天気を出力する
    func outputWeather()
}

protocol WeatherModelProtocol:AnyObject{
    /// 天気を取得する
    func fetchWeather()
}
