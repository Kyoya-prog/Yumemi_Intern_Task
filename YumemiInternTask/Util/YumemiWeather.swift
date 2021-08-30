import Foundation
import UIKit

enum Weather: String {
    case sunny
    case cloudy
    case rainy
}

extension Weather {
    var image: UIImage {
        var image: UIImage?
        switch self {
        case .sunny:
            image = UIImage(named: "sunny")

        case .cloudy:
            image = UIImage(named: "cloudy")

        case .rainy:
            image = UIImage(named: "rainy")
        }
        guard  let image = image else {
            fatalError("image not found")
        }
        return image
    }
}
