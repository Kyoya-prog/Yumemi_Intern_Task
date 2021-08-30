import Foundation
import YumemiWeather

class WeatherModel: WeatherModelProtocol {
    var output: WeatherPresentationOutput
    init() {
        output = WeatherPresenter()
    }
    func fetchWeather() {
        let weatherString = YumemiWeather.fetchWeather()
        output.outputWeather(weatherString: weatherString)
    }
}
