//
//  WeatherModelTests.swift
//  YumemiInternTaskTests
//
//  Created by 松山 響也 on 2021/09/02.
//

import XCTest
@testable import YumemiInternTask

class WeatherModelTests: XCTestCase {
    func test_decode_json_String() {
        let model = WeatherModel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let expectedDate = dateFormatter.date(from: "2020-04-01T12:00:00+09:00") ?? Date()
        let expected = Weather(weather: .sunny, maxTemp: 11, minTemp: 4, date: expectedDate)
        do {
            let responseModel = try model.convert(with: jsonString)
            XCTAssertEqual(expected, responseModel)
        } catch {
            XCTFail("convert failed because of \(error.localizedDescription)")
        }
    }
    private let jsonString = #"""
        {"max_temp":11,"date":"2020-04-01T12:00:00+09:00","min_temp":4,"weather":"sunny"}
    """#
}
