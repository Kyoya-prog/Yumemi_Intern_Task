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

    func outputWeather(jsonString:String) {
        let data = Data(jsonString.utf8)
        let weatherInfo = convertDataToResponse(data: data)
        view?.showWeatherImage(weather: weatherInfo)
    }

    func outputWeatherError(_ error: WeatherError) {
        view?.showError(withMesssage: error.errorMessage)
    }
    
    private func convertDataToResponse(data:Data)->WeatherResponse{
        let weatherDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let maxTemp = weatherDictionary?["max_temp"] as? Int,
              let minTemp = weatherDictionary?["min_temp"] as? Int,
              let weatherString = weatherDictionary?["weather"] as? String,
              let dateString = weatherDictionary?["date"] as? String else {
            fatalError("converting is failed")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("dateFormatting is failed")
        }
        
        guard let weather = Weather(rawValue: weatherString) else {
            fatalError("unexpecetd Weather String \(weatherString)")
        }
        
        return .init(weather: weather, maxTemperature: maxTemp, minTemperature: minTemp, date: date)
        
    }
}
