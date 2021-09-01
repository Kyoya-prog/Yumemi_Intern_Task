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

    func outputWeather(_ weather: Weather) {
        view?.showWeather(weather)
    }

    func outputWeatherError(_ error: AppError) {
        view?.showError(withMesssage: error.errorMessage)
    }
}
