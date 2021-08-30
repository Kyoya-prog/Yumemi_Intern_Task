import Foundation
import YumemiWeather

class WeatherModel: WeatherModelProtocol {
    var output: WeatherPresentationOutput?

    init(output: WeatherPresentationOutput) {
        self.output = output
    }

    // MARK: WeatherModelProtocol
    
    func fetchWeather() {
        let weatherString = YumemiWeather.fetchWeather()
        output?.outputWeather(weatherString: weatherString)
    }
}
