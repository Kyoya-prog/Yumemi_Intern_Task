import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        addConstraint()
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

    private func addConstraint() {
        NSLayoutConstraint.activate([
            centerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),

            weatherImageView.topAnchor.constraint(equalTo: centerView.topAnchor),
            weatherImageView.leftAnchor.constraint(equalTo: centerView.leftAnchor),
            weatherImageView.rightAnchor.constraint(equalTo: centerView.rightAnchor),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor),

            blueLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
            blueLabel.leftAnchor.constraint(equalTo: weatherImageView.leftAnchor),
            blueLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            blueLabel.heightAnchor.constraint(equalToConstant: 30),
            blueLabel.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),

            redLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
            redLabel.leftAnchor.constraint(equalTo: blueLabel.rightAnchor),
            redLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            redLabel.heightAnchor.constraint(equalToConstant: 30),
            redLabel.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 80),
            closeButton.centerXAnchor.constraint(equalTo: blueLabel.centerXAnchor),

            reloadButton.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 80),
            reloadButton.centerXAnchor.constraint(equalTo: redLabel.centerXAnchor)
        ])
    }
}
