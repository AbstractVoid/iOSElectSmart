//
//  Candidate.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation

public class Candidate {
    
    let candidateID: String
    let name: String
    let party: String
    
    
    init(candidateID: String, name: String, party: String) {
        self.candidateID = candidateID
        self.name = name
        self.party = party
    }
    
    //static func getDummyCandidates() -> [Candidate] {
    
        //var candidates = [Candidate]()
        
        //let bernie: Candidate = Candidate(title: "Bernie Sanders", meta: "", party: "Democrat", candidate_url: "", bio: "The man", photo: "https://upload.wikimedia.org/wikipedia/commons/8/83/Bernie_Sanders_1991.jpg")
        //let hillary: Candidate = Candidate(title: "Hillary Clinton", meta: "", party: "Democrat", candidate_url: "", bio: "She's definitely running", photo: "https://upload.wikimedia.org/wikipedia/commons/d/d2/Defense.gov_photo_essay_091203-N-0696M-239.jpg")
        //let donald: Candidate = Candidate(title: "Donald Drumpf", meta: "", party: "Republican", candidate_url: "", bio: "A terrible human being", photo: "https://pbs.twimg.com/profile_images/704163604703158272/LtrEadTR.jpg")
        //let ted: Candidate = Candidate(title: "Ted Cruz", meta: "", party: "Republican", candidate_url: "", bio: "Maybe better than drumpf but probably not", photo: "https://cdn.evbuc.com/eventlogos/4918511/tedcruz.jpg")
        
        //candidates.append(bernie)
        //candidates.append(hillary)
        //candidates.append(donald)
        //candidates.append(ted)
        
       // return candidates
    //}
}