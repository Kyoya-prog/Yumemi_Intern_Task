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

protocol WeatherPresentationOutput:AnyObject{
    /// 取得した天気を出力する
    /// - parameter weatherString;天気を表す文字列
    func outputWeather(weatherString:String)
}

protocol WeatherModelProtocol:AnyObject{
    /// 天気を取得する
    func fetchWeather()
}
