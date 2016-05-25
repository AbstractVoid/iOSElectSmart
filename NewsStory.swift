//
//  NewsStory.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/13/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation

public class NewsStory {
    
    let title: String
    let ID: String
    let url: String
    let date: NSDate
    let source: String
    let description: String
    
    init(title: String, ID: String, url: String, date: NSDate, source: String, description: String) {
        
        self.title = title
        self.ID = ID
        self.url = url
        self.date = date
        self.source = source
        self.description = description
    }
}