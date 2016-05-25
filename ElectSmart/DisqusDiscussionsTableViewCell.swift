//
//  DisqusDiscussionsTableViewCell.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/7/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class DisqusDiscussionsTableViewCell: UITableViewCell {
    
    var discussion: Discussion?
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var repliesLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var upvoteButton: UIButton!
    @IBOutlet weak var downvoteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Configure the cell layout
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateVoteButtons()
    }
    
    // Discussion post interactions
    
    @IBAction func upvote(sender: AnyObject) {
        if (discussion!.userDownvoted) {
            discussion!.updateScore(2)
            scoreLabel.text = String(discussion!.score)
            discussion!.userUpvoted = true
            discussion!.userDownvoted = false
        } else if (!discussion!.userUpvoted) {
            discussion!.updateScore(1)
            scoreLabel.text = String(discussion!.score)
            discussion!.userUpvoted = true
            discussion!.userDownvoted = false
        } else {
            discussion!.updateScore(-1)
            scoreLabel.text = String(discussion!.score)
            discussion!.userUpvoted = false
        }
        updateVoteButtons()
    }
    
    @IBAction func downvote(sender: AnyObject) {
        if (discussion!.userUpvoted) {
            discussion!.updateScore(-2)
            scoreLabel.text = String(discussion!.score)
            discussion!.userUpvoted = false
            discussion!.userDownvoted = true
        } else if (!discussion!.userDownvoted) {
            discussion!.updateScore(-1)
            scoreLabel.text = String(discussion!.score)
            discussion!.userUpvoted = false
            discussion!.userDownvoted = true
        } else {
            discussion!.updateScore(1)
            scoreLabel.text = String(discussion!.score)
            discussion!.userDownvoted = false
        }
        updateVoteButtons()
    }
    
    private func updateVoteButtons() {
        upvoteButton.selected = discussion!.userUpvoted
        downvoteButton.selected = discussion!.userDownvoted
    }
}
