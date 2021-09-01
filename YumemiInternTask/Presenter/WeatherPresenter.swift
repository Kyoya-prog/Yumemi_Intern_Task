import Foundation

class WeatherPresenter: WeatherPresentation, WeatherPresentationOutput {
    var view: WeatherView?
    var model: WeatherModelProtocol!

    // MARK: WeatherPresentation

    func fetchWeather() {
        model.fetchWeather()
    }

    // MARK: WeatherPresentationOutput

    func outputWeather(_ model: Weather) {
        view?.showWeather(model)
    }

    func outputWeatherError(_ error: AppError) {
        view?.showError(withMesssage: error.errorMessage)
    }
}
