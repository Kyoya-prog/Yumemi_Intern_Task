import Foundation
import class UIKit.UIColor

enum Color {
    case buttonColor1
    case baseColorRed
    case baseColorBlue
}

extension Color {
    var value: UIColor {
        switch  self {
        case .buttonColor1:
            return UIColor(red: 0.024, green: 0.412, blue: 0.678, alpha: 1.0)

        case .baseColorRed:
            return .red

        case .baseColorBlue:
            return .blue
        }
    }
}
