//
//  NewsStoryTests.swift
//  ElectSmartTests
//
//  Created by Stephen Gaschignard on 4/6/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest
@testable import ElectSmart

class NewsStoryTests: XCTestCase {

    var testStory: NewsStory?
    
    override func setUp() {
        super.setUp()
        
        testStory = NewsStory(title: "This is a News Story",
                              ID: "12345",
                              url: "http://www.apple.com",
                              date: NSDate(timeIntervalSince1970: 10000000),
                              source: "Apple",
                              description: "Awesome Story")
    }
    
    override func tearDown() {
        testStory = nil
        
        super.tearDown()
    }

    func testInit() {
        let expectedTitle = "This is a News Story"
        let expectedId = "12345"
        let expectedUrl = "http://www.apple.com"
        let expectedDate = NSDate(timeIntervalSince1970: 10000000)
        let expectedSource = "Apple"
        let expectedDescription = "Awesome Story"
        
        XCTAssertEqual(expectedTitle, testStory?.title, "the title should be \"This is a News Story\"")
        XCTAssertEqual(expectedId, testStory?.ID, "the ID should be \"12345\"")
        XCTAssertEqual(expectedUrl, testStory?.url, "the URL should be \"http://www.apple.com\"")
        XCTAssertEqual(expectedDate, testStory?.date, "the date should be 10000000 since 1970")
        XCTAssertEqual(expectedSource, testStory?.source, "the source should be \"Apple\"")
        XCTAssertEqual(expectedDescription, testStory?.description, "the description should be \"Awesome Story\"")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
