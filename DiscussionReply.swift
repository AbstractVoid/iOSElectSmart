//
//  DiscussionReply.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation

public class DiscussionReply {
    
    let content: String
    let datePosted: NSDate
    var score: Int
    var userUpvoted: Bool
    var userDownvoted: Bool
    
    init(content: String) {
        
        self.content = content
        self.datePosted = NSDate()
        self.score = 0
        self.userUpvoted = false
        self.userDownvoted = false
    }
    
    init(content: String, datePosted: NSDate, replies: [DiscussionReply], score: Int, userUpvoted: Bool, userDownvoted: Bool) {
        
        self.content = content
        self.datePosted = datePosted
        self.score = score
        self.userUpvoted = userUpvoted
        self.userDownvoted = userDownvoted
    }
    
    internal func updateScore(vote: Int) {
        self.score += vote
    }
}