//
//  Election.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation

public class Election {
    
    let electionID: String
    let title: String
    let date: NSDate
    let stateID: String
    var candidates: [Candidate] = []
    var meta: String?
    
    init(electionID: String, title: String, date: NSDate, stateID: String) {
        
        self.electionID = electionID
        self.title = title
        self.date = date
        self.stateID = stateID
    }
    
    static func getDummyElections() -> [Election] {
        
        // TODO: CHANGE
        //var candidates = Candidate.getDummyCandidates()
        //var candidates1 = [Candidate]()
        //var candidates2 = [Candidate]()
        
        //candidates1.append(candidates[0])
        //candidates1.append(candidates[1])
        //candidates1.append(candidates[2])
        //candidates1.append(candidates[3])
        
        //candidates2.append(candidates[0])
        //candidates2.append(candidates[3])
        
        var elections = [Election]()

        let election1 = Election(electionID: "1234", title: "United States Presidential Election", date: NSDate.init(), stateID: "NA")
        let election2 = Election(electionID: "123", title: "Wisconsin Caucus", date: NSDate.init(), stateID: "WI")
        let election3 = Election(electionID: "123", title: "Presidential Election" , date: NSDate.init(), stateID: "NA")
        
        elections.append(election1)
        elections.append(election2)
        elections.append(election3)
        
        return elections
    }
}