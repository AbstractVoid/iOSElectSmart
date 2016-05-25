//
//  ElectSmartUITests.swift
//  ElectSmartUITests
//
//  Created by Nick on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest

class ElectSmartUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testView() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Upcoming"].tap()
        tabBarsQuery.buttons["Current Events"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.buttons["Set New Location"].tap()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).matchingIdentifier("Continue").elementBoundByIndex(1).tap()
        tabBarsQuery.buttons["Home"].tap()
        XCTAssertEqual(tablesQuery.cells.count, 10)
        
        //XCTAssertTrue(table.exists)
        //XCTAssertEqual(table.cells.count, 10)
        
        
    }
    
}

// TODO: Use this function to fix buggy test code
/*
func waitForElementToAppear(element: XCUIElement, file: String = __FILE__, line: UInt = __LINE__) {
    let existsPredicate = NSPredicate(format: "exists == true")
    expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
    ​
    waitForExpectationsWithTimeout(5) { (error) -> Void in
        if (error != nil) {
            let message = "Failed to find \(element) after 5 seconds."
            self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
        }
    }
}
*/