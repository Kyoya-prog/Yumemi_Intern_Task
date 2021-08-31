import Foundation

struct Weather:Decodable {
    var weather: String
    var maxTemperature: Int
    var minTemperature: Int
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case weather
        case maxTemperature = "max_temp"
        case minTemperature = "min_temp"
        case date
    }
}
