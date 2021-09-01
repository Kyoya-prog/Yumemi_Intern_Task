import Foundation

struct Weather: Decodable {
    var weather: String
    var maxTemp: Int
    var minTemp: Int
    var date: Date
}
