import class UIKit.UIViewController

final class WeatherModuleAssembler {
    static func assembleWeatherModule() -> UIViewController {
        let view = WeatherViewController()
        let presenter = WeatherPresenter()
        let model = WeatherModel()

        view.presenter = presenter
        presenter.view = view
        presenter.model = model
        model.output = presenter

        return view
    }
}
