import Foundation

struct Weather: Decodable {
    var weather: WeatherType
    var maxTemp: Int
    var minTemp: Int
    var date: Date
}
