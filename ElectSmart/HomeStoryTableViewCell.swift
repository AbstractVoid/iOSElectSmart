//
//  HomeStoryTableViewCellController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class HomeStoryTableViewCell: UITableViewCell {
    
    var date: NSDate?
    
    @IBOutlet weak var newsStoryTitleLabel: UILabel!
    @IBOutlet weak var newsStorySourceLabel: UILabel!
    @IBOutlet weak var newsStoryDateLabel: UILabel!
    @IBOutlet weak var newsStoryContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Configure the story title
        dispatch_async(dispatch_get_main_queue(), {
            self.newsStoryTitleLabel.font = UIFont.boldSystemFontOfSize(21.0)
            self.newsStoryTitleLabel.textColor = UIColor.blackColor()
        
        // Configure the source appearance
            self.newsStorySourceLabel.font = UIFont.boldSystemFontOfSize(11.0)
            self.newsStorySourceLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        // Configure the date appearance
            self.newsStoryDateLabel.font = UIFont.systemFontOfSize(11.0)
            self.newsStoryDateLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        // Configure the story content
            self.newsStoryContentLabel.font = UIFont.systemFontOfSize(15.0)
            self.newsStoryContentLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dispatch_async(dispatch_get_main_queue(), {
            self.newsStorySourceLabel.text = self.newsStorySourceLabel.text?.uppercaseString
            self.newsStorySourceLabel.sizeToFit()
        
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.timeStyle = .ShortStyle
            let dateString = formatter.stringFromDate(self.date!)
        
            self.newsStoryDateLabel.text = dateString.uppercaseString
            self.newsStoryDateLabel.setNeedsDisplay()
        })
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
