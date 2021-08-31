import Foundation

struct WeatherResponse {
    var weather: Weather
    var maxTemperature: Int
    var minTemperature: Int
    var date: Date
}

enum Weather: String {
    case sunny
    case cloudy
    case rainy
}

