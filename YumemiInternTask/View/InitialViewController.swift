import Foundation
import UIKit

class InitialViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let weatherViewController = WeatherViewController()
        weatherViewController.modalPresentationStyle = .fullScreen
        present(weatherViewController, animated: true, completion: nil)
    }
}
