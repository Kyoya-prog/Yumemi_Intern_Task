import Foundation

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

    func outputWeather(_ response: WeatherResponse) {
        view?.showWeather(response: response)
    }

    func outputWeatherError(_ error: WeatherError) {
        view?.showError(withMesssage: error.errorMessage)
    }
}
