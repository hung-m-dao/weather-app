//
//  WeatherAppViewControllerTests.swift
//  WeatherAppUITests
//
//  Created by Hung Dao on 21/09/2021.
//

import XCTest
@testable import WeatherApp

class WeatherForecastViewControllerTests: XCTestCase {
    var storyboard: UIStoryboard!
    var sut: WeatherForecastViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        continueAfterFailure = false
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "WeatherForecastViewController") as WeatherForecastViewController
        sut.loadViewIfNeeded()
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testViewController_HasValidSearchBar() throws {
        let searchBar = try XCTUnwrap(sut.searchBar, "The search bar outlet has not been set")
        XCTAssertEqual(searchBar.text, "", "The search bar is not initially empty")
    }

}
