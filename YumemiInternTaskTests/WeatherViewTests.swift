//
//  WeatherViewTests.swift
//  YumemiInternTaskTests
//
//  Created by 松山 響也 on 2021/09/02.
// swiftlint:disable force_unwrapping

import XCTest
@testable import YumemiInternTask

class WeatherViewTests: XCTestCase {
    override func setUpWithError() throws {
        view.presenter = presenter
        presenter.view = view
    }

    // MARK: Private
    private let view = WeatherViewController()

    private let presenter = WeatherPresenter()

    func test_display_sunny_icon_when_response_is_sunny() {
        let model = WeatherModelStub(weatherType: .sunny)
        presenter.model = model
        model.output = presenter
        view.viewDidLoad()
        view.reloadButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(view.weatherImage, UIImage(named: "sunny")!.withRenderingMode(.alwaysTemplate))
    }

    func test_display_cloudy_icon_when_response_is_cloudy() {
        let model = WeatherModelStub(weatherType: .cloudy)
        presenter.model = model
        model.output = presenter
        view.viewDidLoad()
        view.reloadButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(view.weatherImage, UIImage(named: "cloudy")!.withRenderingMode(.alwaysTemplate))
    }

    func test_display_rainy_icon_when_response_is_rainy() {
        let model = WeatherModelStub(weatherType: .rainy)
        presenter.model = model
        model.output = presenter
        view.viewDidLoad()
        view.reloadButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(view.weatherImage, UIImage(named: "rainy")!.withRenderingMode(.alwaysTemplate))
    }
}

private class WeatherModelStub: WeatherModelProtocol {
    weak var output: WeatherPresentationOutput?
    init(weatherType: WeatherType) {
        responseWeatherType = weatherType
    }

    func fetchWeather() {
        output?.outputWeather(.init(weather: responseWeatherType, maxTemp: 0, minTemp: 0, date: Date()))
    }

    // MARK: Private
    private var responseWeatherType: WeatherType
}
