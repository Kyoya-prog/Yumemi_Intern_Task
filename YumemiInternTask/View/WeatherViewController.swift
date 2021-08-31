import UIKit

class WeatherViewController: UIViewController, WeatherView {
    var presenter: WeatherPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        addConstraint()
        presenter = WeatherPresenter(view: self)
    }

    // MARK: WeatherView

    func showWeather(weather: WeatherResponse) {
        weatherImageView.image = weather.weather.image
        weatherImageView.tintColor = weather.weather.color
    }

    func showError(message: String) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // MARK: Private

    private let weatherImageView = UIImageView()

    private let blueLabel = UILabel()

    private let redLabel = UILabel()

    private let closeButton = UIButton(type: .system)

    private let reloadButton = UIButton(type: .system)

    private let centerView = UIView()

    private func setUpSubviews() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerView)

        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(weatherImageView)

        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.text = "blue"
        blueLabel.textColor = Color.baseColorBlue.value
        blueLabel.textAlignment = .center
        centerView.addSubview(blueLabel)

        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.text = "red"
        redLabel.textColor = Color.baseColorRed.value
        redLabel.textAlignment = .center
        centerView.addSubview(redLabel)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("close", for: .normal)
        view.addSubview(closeButton)

        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.setTitle("reload", for: .normal)
        reloadButton.addTarget(self, action: #selector(reloadButtonAction(_:)), for: .touchUpInside)
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

    @objc private func reloadButtonAction(_ sender: UIButton) {
        presenter.fetchWeather()
    }
}
