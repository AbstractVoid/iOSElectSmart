//
//  ElectionTests.swift
//  ElectSmartTests
//
//  Created by Stephen Gaschignard on 4/6/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import XCTest
@testable import ElectSmart

class ElectionTests: XCTestCase {
    
    var testElection: Election?
    var testCandidateForElection1: Candidate?
    var testCandidateForElection2: Candidate?
    var testCandidatesForElection: [Candidate]?

    override func setUp() {
        super.setUp()
        
        testCandidateForElection1 = Candidate(title: "The Bern", meta: "Sanders", party: "Democrat", candidate_url: "http://www.apple.com", bio: "Test Bio", photo: "http://www.apple.com")
        testCandidateForElection2 = Candidate(title: "Donald Drumpf", meta: "Clinton", party: "Republican", candidate_url: "http://www.apple.com", bio: "Test Bio", photo: "http://www.apple.com")
        testCandidatesForElection = [testCandidateForElection1!, testCandidateForElection2!]
        
        testElection = Election(title: "Test Election",
                                date: NSDate(timeIntervalSince1970: 10000000),
                                candidates: testCandidatesForElection!,
                                meta: "Some test metadata")
    }
    
    override func tearDown() {
        testCandidateForElection1 = nil
        testCandidateForElection2 = nil
        testCandidatesForElection = nil
        testElection = nil
        
        super.tearDown()
    }

    func testInit() {
        let expectedTitle = "Test Election"
        let expectedDate = NSDate(timeIntervalSince1970: 10000000)
        let expectedCandidatesForElection = [testCandidateForElection1, testCandidateForElection2]
        let expectedMeta = "Some test metadata"
        
        XCTAssertEqual(expectedTitle, testElection?.title, "the title should be \"Test Election\"")
        XCTAssertEqual(expectedDate, testElection?.date, "the date should be 10000000 since 1970")
        XCTAssertEqual(expectedCandidatesForElection[0]!.title, testElection?.candidates[0].title, "the candidate title should be The Bern")
        XCTAssertEqual(expectedCandidatesForElection[1]!.title, testElection?.candidates[1].title, "the candidate title should be Donald Drumpf")
        XCTAssertEqual(expectedMeta, testElection?.meta, "the meta should be \"Some test metadata\"")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
