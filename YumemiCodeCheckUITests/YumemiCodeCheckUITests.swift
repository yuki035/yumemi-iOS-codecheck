//
//  YumemiCodeCheckUITests.swift
//  YumemiCodeCheckUITests
//
//  Created by 森祐樹 on 2024/04/24.
//

import XCTest

final class YumemiCodeCheckUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLabelValue() throws {
        let app = XCUIApplication()
        app.launch()

        let text1 = app.staticTexts["text1"]
        let text2 = app.staticTexts["text2"]

        XCTAssertTrue(text1.exists)
        XCTAssertTrue(text2.exists)

        XCTAssertEqual(text1.label, "相性のいい都道府県を")
        XCTAssertEqual(text2.label, "占ってあげる🔮")
    }
}
