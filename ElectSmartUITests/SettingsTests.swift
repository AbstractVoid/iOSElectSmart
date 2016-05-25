//
//  SettingsTests.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/7/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest

class SettingsTests: XCTestCase {
        
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
    
    // Test if settings view loads correctly
    func testView() {
        
        
        let app = XCUIApplication()
        sleep(4)
        app.tabBars.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        
        tablesQuery.switches["Local Elections"].tap()
        tablesQuery.switches["State Elections"].tap()
        tablesQuery.switches["National Elections"].tap()
        tablesQuery.switches["Debates"].tap()
        tablesQuery.switches["Caucuses"].tap()
        tablesQuery.switches["Elections"].tap()
        tablesQuery.switches["Registration"].tap()
        
        
    }
    
}
