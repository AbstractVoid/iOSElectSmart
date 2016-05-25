//
//  HomeStoryTableViewCellController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CurrentEventsTableViewCell: UITableViewCell {
    
    var date: NSDate?
    
    @IBOutlet weak var currentEventTitleLabel: UILabel!
    @IBOutlet weak var currentEventSourceLabel: UILabel!
    @IBOutlet weak var currentEventDateLabel: UILabel!
    @IBOutlet weak var currentEventContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Configure the story title
        currentEventTitleLabel.font = UIFont.boldSystemFontOfSize(21.0)
        currentEventTitleLabel.textColor = UIColor.blackColor()
        
        // Configure the source appearance
        currentEventSourceLabel.font = UIFont.boldSystemFontOfSize(11.0)
        currentEventSourceLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        // Configure the date appearance
        currentEventDateLabel.font = UIFont.systemFontOfSize(11.0)
        currentEventDateLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        // Configure the story content
        currentEventContentLabel.font = UIFont.systemFontOfSize(15.0)
        currentEventContentLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        currentEventSourceLabel.text = currentEventSourceLabel.text?.uppercaseString
        currentEventSourceLabel.sizeToFit()
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .ShortStyle
        let dateString = formatter.stringFromDate(date!)
        
        currentEventDateLabel.text = dateString.uppercaseString
        currentEventDateLabel.setNeedsDisplay()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
