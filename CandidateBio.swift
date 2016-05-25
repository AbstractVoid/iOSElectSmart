//
//  CandidateBio.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/29/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation

// Vote Smart API only has photo in candidateBio. Other useful info is in detailedBio

public class CandidateBio {
    
    let photo: String
    
    init(photo: String) {
        self.photo = photo;

    }
}