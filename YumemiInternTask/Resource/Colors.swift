import Foundation
import class UIKit.UIColor

enum Color {
    case baseColorRed
    case baseColorBlue
    case baseColorGray
}

extension Color {
    var value: UIColor {
        switch  self {
        case .baseColorRed:
            return .red

        case .baseColorBlue:
            return .blue

        case .baseColorGray:
            return .gray
        }
    }
}
