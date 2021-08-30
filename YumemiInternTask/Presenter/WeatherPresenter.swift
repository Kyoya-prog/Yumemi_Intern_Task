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
        let image = decideWeatherIcon(weatherString: weatherString)
        view.showWeatherImage(image: image)
    }
    
    private func decideWeatherIcon(weatherString:String)->UIImage {
        var image:UIImage?
        switch weatherString {
        case "sunny":
            image = UIImage(named: "sunny")
        case "cloudy":
            image = UIImage(named: "cloudy")
        case "rainy":
            image = UIImage(named: "rainy")
        default:
            image = nil
        }
        guard let image = image else {
            fatalError("unexpected weather string was returned")
        }
        
        return image
    }

}
