import Foundation
import UIKit

class WeatherPresenter:WeatherPresentation,WeatherPresentationOutput{
    var view:WeatherView
    //var model:WeatherModelProtocol
    
    init() {
        view = WeatherViewController()
        //model = WeatherModel()
    }

    func fetchWeather() {
        //model.fetchWeather()
    }
    
    func outputWeather(weatherString:String) {
        view.showWeatherImage(image: UIImage())
    }

}
