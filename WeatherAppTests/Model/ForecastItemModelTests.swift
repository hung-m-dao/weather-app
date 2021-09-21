//
//  ForecastItemModelTests.swift
//  WeatherAppTests
//
//  Created by Hung Dao on 21/09/2021.
//

import XCTest
@testable import WeatherApp
class ForecastItemModelTests: XCTestCase {
    var json: String!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        json = """
            {
            "dt": 1632196800,
            "sunrise": 1632177755,
            "sunset": 1632221429,
            "temp": {
                "day": 30.97,
                "min": 23.66,
                "max": 30.97,
                "night": 24.9,
                "eve": 27.05,
                "morn": 23.66
            },
            "feels_like": {
                "day": 35.29,
                "night": 25.82,
                "eve": 30.15,
                "morn": 24.51
            },
            "pressure": 1009,
            "humidity": 62,
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10d"
                }
            ],
            "speed": 3.57,
            "deg": 220,
            "gust": 5.25,
            "clouds": 40,
            "pop": 1,
            "rain": 9.68
        }
        """
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastItemModel_shouldBeAbleToParse() throws {
        let decoder = JSONDecoder()
        let item = try decoder.decode(ForecastItem.self, from: Data(json.utf8))
        
        XCTAssertEqual(item.avgTemp, 30.97)
        XCTAssertEqual(item.humidity, 62)
        XCTAssertEqual(item.pressure, 1009)
    }
    
    func testForecastItemModel_canParseDateString() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let item = try decoder.decode(ForecastItem.self, from: Data(json.utf8))
        
        XCTAssertEqual(item.getDateString(), "Tue, 21 Sep 2021")
    }
    
    func testForecastItemModel_hasCorrectIconUrl() throws {
        let decoder = JSONDecoder()
        let item = try decoder.decode(ForecastItem.self, from: Data(json.utf8))
        
        XCTAssertEqual(item.getIconUrl()?.absoluteString, "http://openweathermap.org/img/wn/10d@2x.png")
    }
    
}
