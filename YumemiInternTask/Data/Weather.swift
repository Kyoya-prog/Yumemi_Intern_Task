import Foundation

struct Weather: Decodable, Equatable {
    var weather: WeatherType
    var maxTemp: Int
    var minTemp: Int
    var date: Date
}
