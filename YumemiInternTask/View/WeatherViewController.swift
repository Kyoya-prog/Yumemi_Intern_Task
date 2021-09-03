import UIKit

final class WeatherViewController: UIViewController, WeatherView {
    var presenter: WeatherPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpSubviews()
        addConstraint()
        notificationCenter.addObserver(self, selector: #selector(reload(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    // MARK: WeatherView

    func showWeather(_ weather: Weather) {
        weatherImageView.image = weather.weather.image
        weatherImageView.tintColor = weather.weather.color
        maxTempLabel.text = "\(weather.maxTemp)"
        minTempLabel.text = "\(weather.minTemp)"
    }

    func showError(withMesssage message: String) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }

    var weatherImage: UIImage? {
        weatherImageView.image
    }

    var minTemp: Int? {
        Int(minTempLabel.text ?? "")
    }

    var maxTemp: Int? {
        Int(maxTempLabel.text ?? "")
    }

    let reloadButton = UIButton(type: .system)

    // MARK: Private

    private let weatherImageView = UIImageView()

    private let minTempLabel = UILabel()

    private let maxTempLabel = UILabel()

    private let closeButton = UIButton(type: .system)

    private let centerView = UIView()

    private let notificationCenter = NotificationCenter.default

    private func setUpSubviews() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerView)

        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(weatherImageView)

        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.text = "blue"
        minTempLabel.textColor = Color.baseColorBlue.value
        minTempLabel.textAlignment = .center
        centerView.addSubview(minTempLabel)

        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.text = "red"
        maxTempLabel.textColor = Color.baseColorRed.value
        maxTempLabel.textAlignment = .center
        centerView.addSubview(maxTempLabel)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("close", for: .normal)
        closeButton.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        view.addSubview(closeButton)

        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.setTitle("reload", for: .normal)
        reloadButton.addTarget(self, action: #selector(reload(_:)), for: .touchUpInside)
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

            minTempLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
            minTempLabel.leftAnchor.constraint(equalTo: weatherImageView.leftAnchor),
            minTempLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            minTempLabel.heightAnchor.constraint(equalToConstant: 30),
            minTempLabel.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),

            maxTempLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
            maxTempLabel.leftAnchor.constraint(equalTo: minTempLabel.rightAnchor),
            maxTempLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            maxTempLabel.heightAnchor.constraint(equalToConstant: 30),
            maxTempLabel.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 80),
            closeButton.centerXAnchor.constraint(equalTo: minTempLabel.centerXAnchor),

            reloadButton.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 80),
            reloadButton.centerXAnchor.constraint(equalTo: maxTempLabel.centerXAnchor)
        ])
    }

    @objc private func reload(_ sender: UIButton) {
        presenter.fetchWeather()
    }

    @objc private func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
