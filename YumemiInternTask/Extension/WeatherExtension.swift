import Foundation
import UIKit

extension WeatherType {
    var image: UIImage {
        var image: UIImage?
        switch self {
        case .sunny:
            image = UIImage(named: "sunny")?.withRenderingMode(.alwaysTemplate)

        case .cloudy:
            image = UIImage(named: "cloudy")?.withRenderingMode(.alwaysTemplate)

        case .rainy:
            image = UIImage(named: "rainy")?.withRenderingMode(.alwaysTemplate)
        }
        guard  let image = image else {
            fatalError("image not found")
        }
        return image
    }

    var color: UIColor {
        switch self {
        case .sunny:
            return Color.baseColorRed.value

        case .cloudy:
            return Color.baseColorGray.value

        case .rainy:
            return Color.baseColorBlue.value
        }
    }
}
