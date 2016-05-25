//
//  DisqusPostUITest.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/7/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest

class DisqusPostUITest: XCTestCase {
        
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
    
    func testExample() {
        
        
        let app = XCUIApplication()
        app.tabBars.buttons["Upcoming"].tap()
        app.collectionViews.cells.otherElements.containingType(.StaticText, identifier:"March 15").images["calendar-blank"].tap()
        
        let tablesQuery2 = app.tables
        let tablesQuery = tablesQuery2
        tablesQuery.staticTexts["Bernie Sanders"].tap()
        tablesQuery2.cells.containingType(.StaticText, identifier:"Candidate Bio").childrenMatchingType(.TextView).element.tap()
        tablesQuery.buttons["Go To Discussion Form"].tap()
        
        
    }
    
}
