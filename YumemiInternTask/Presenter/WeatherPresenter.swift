import Foundation
import UIKit

class WeatherPresenter: WeatherPresentation, WeatherPresentationOutput {
    var view: WeatherView?
    var model: WeatherModelProtocol!

    init(view: WeatherView) {
        self.view = view
        self.model = WeatherModel(output: self)
    }

    // MARK: WeatherPresentation
    
    func fetchWeather() {
        model.fetchWeather()
    }

    // MARK: WeatherPresentationOutput
    
    func outputWeather(weatherString: String) {
        guard let weather = Weather(rawValue: weatherString) else {
            fatalError("Unwxpected Weather String. YumemiWeather returned \(weatherString)")
        }
        view?.showWeatherImage(image: weather.image, color: weather.color)
    }
}
