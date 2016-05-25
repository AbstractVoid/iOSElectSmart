//
//  CandidateTests.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/6/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest
@testable import ElectSmart

class CandidateTests: XCTestCase {
    
    var testCandidate: Candidate?

    override func setUp() {
        super.setUp()
        
        testCandidate = Candidate(title: "Hillz",
                                  meta: "Ready4Hillary",
                                  party: "Democrat",
                                  candidate_url: "http://www.apple.com",
                                  bio: "Pant suit extraordinaire",
                                  photo: "http://www.apple.com")
    }
    
    override func tearDown() {
        testCandidate = nil
        
        super.tearDown()
    }

    func testInit() {
        let expectedTitle = "Hillz"
        let expectedMeta = "Ready4Hillary"
        let expectedParty = "Democrat"
        let expectedCandidate_Url = "http://www.apple.com"
        let expectedBio = "Pant suit extraordinaire"
        let expectedPhoto = "http://www.apple.com"
        
        XCTAssertEqual(expectedTitle, testCandidate?.title, "the title should be \"Hillz\"")
        XCTAssertEqual(expectedMeta, testCandidate?.meta, "the meta should be \"Ready4Hillary\"")
        XCTAssertEqual(expectedParty, testCandidate?.party, "the party should be \"Democrat\"")
        XCTAssertEqual(expectedCandidate_Url, testCandidate?.candidate_url, "the candidate_url should be \"http://www.apple.com\"")
        XCTAssertEqual(expectedBio, testCandidate?.bio, "the bio should be \"Pant suit extraordinaire\"")
        XCTAssertEqual(expectedPhoto, testCandidate?.photo, "the photo should be \"http://www.apple.com\"")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
