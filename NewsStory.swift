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
    let subtitle: String
    let author: String
    let date: NSDate
    let publisher: String
    let content: String
    let image: String?
    let meta: String?
    
    init(title: String, subtitle: String, author: String, date: NSDate, publisher: String, content: String, image: String, meta: String) {
        
        self.title = title
        self.subtitle = subtitle
        self.author = author
        self.date = date
        self.publisher = publisher
        self.content = content
        self.image = image
        self.meta = meta
    }
}