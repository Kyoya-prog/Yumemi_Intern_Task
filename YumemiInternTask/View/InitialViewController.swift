import Foundation
import UIKit

class InitialViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let weatherView = WeatherViewController()
        weatherView.modalPresentationStyle = .fullScreen
        present(weatherView, animated: true, completion: nil)
    }
}
