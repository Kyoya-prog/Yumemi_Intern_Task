import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }

    private let weatherImageView = UIImageView()

    private let blueLabel = UILabel()

    private let redLabel = UILabel()

    private let closeButton = UIButton()

    private let reloadButton = UIButton()

    private let centerView = UIView()

    private func setUpSubViews() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerView)

        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.backgroundColor = .black
        centerView.addSubview(weatherImageView)

        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.text = "blue"
        blueLabel.textColor = .blue
        blueLabel.textAlignment = .center
        centerView.addSubview(blueLabel)

        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.text = "red"
        redLabel.textColor = .red
        redLabel.textAlignment = .center
        centerView.addSubview(redLabel)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("close", for: .normal)
        closeButton.setTitleColor(Color.buttonColor1, for: .normal)
        view.addSubview(closeButton)

        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.setTitle("reload", for: .normal)
        reloadButton.setTitleColor(Color.buttonColor1, for: .normal)
        view.addSubview(reloadButton)
    }
}
