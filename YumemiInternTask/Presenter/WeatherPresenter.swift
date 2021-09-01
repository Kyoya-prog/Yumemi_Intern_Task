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

    func outputWeather(_ model: Weather) {
        //        guard let weather = WeatherType(rawValue: model.weather) else {
        //            assertionFailure("weather string (\(model.weather)) is not expected")
        //            let error: WeatherError = .unknownError
        //            view?.showError(withMesssage: error.errorMessage)
        //            return
        //        }
        view?.showWeather(model)
    }

    func outputWeatherError(_ error: AppError) {
        view?.showError(withMesssage: error.errorMessage)
    }
}
