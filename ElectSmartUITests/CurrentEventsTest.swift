//
//  CurrentEventsTest.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/7/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest

class CurrentEventsTests: XCTestCase {
        
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
    
    // Tests that table loads correctly and clicking on cell leads to article
    func testView() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Current Events"].tap()
        
        let tableQuery = app.tables
        XCTAssertEqual(tableQuery.count, 1)
        XCTAssertEqual(tableQuery.cells.count, 10)
        tableQuery.cells.elementBoundByIndex(0).tap()
        
        
    }
    
}
