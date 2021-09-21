//
//  WeatherForecastViewModelTests.swift
//  WeatherAppTests
//
//  Created by Hung Dao on 21/09/2021.
//

import XCTest
@testable import WeatherApp
class WeatherForecastViewModelTests: XCTestCase {
    
    var sut: WeatherForecastViewModel!
    
    override func setUpWithError() throws {
        sut = WeatherForecastViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel_checkValidQueryMethod_shouldReturnsTrue() throws {
        XCTAssertTrue(sut.isValidQuery(term: "abc"))
        XCTAssertTrue(sut.isValidQuery(term: "aaaaa"))
    }
    
    func testViewModel_checkValidQueryMethod_shouldReturnsFalse() throws {
        XCTAssertFalse(sut.isValidQuery(term: "a"))
        XCTAssertFalse(sut.isValidQuery(term: "aa"))
    }
}
