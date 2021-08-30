import enum YumemiWeather.YumemiWeatherError

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
        view?.showWeather(weather)
    }

    func outputWeatherError(error: YumemiWeatherError) {
        var message = ""
        switch error {
        case .invalidParameterError:
            message = "不正なリクエストです"
        case .unknownError:
            message = "不明なエラーが発生しました"
        }
        view?.showError(message: message)
    }
}
