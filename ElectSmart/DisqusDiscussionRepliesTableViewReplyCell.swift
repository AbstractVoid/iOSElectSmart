//
//  DisqusDiscussionRepliesTableViewReplyCell.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/7/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class DisqusDiscussionRepliesTableViewReplyCell: UITableViewCell {
    
    var reply: DiscussionReply?
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
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
        if (reply!.userDownvoted) {
            reply!.updateScore(2)
            scoreLabel.text = String(reply!.score)
            reply!.userUpvoted = true
            reply!.userDownvoted = false
        } else if (!reply!.userUpvoted) {
            reply!.updateScore(1)
            scoreLabel.text = String(reply!.score)
            reply!.userUpvoted = true
            reply!.userDownvoted = false
        } else {
            reply!.updateScore(-1)
            scoreLabel.text = String(reply!.score)
            reply!.userUpvoted = false
        }
        updateVoteButtons()
    }
    
    @IBAction func downvote(sender: AnyObject) {
        if (reply!.userUpvoted) {
            reply!.updateScore(-2)
            scoreLabel.text = String(reply!.score)
            reply!.userUpvoted = false
            reply!.userDownvoted = true
        } else if (!reply!.userDownvoted) {
            reply!.updateScore(-1)
            scoreLabel.text = String(reply!.score)
            reply!.userUpvoted = false
            reply!.userDownvoted = true
        } else {
            reply!.updateScore(1)
            scoreLabel.text = String(reply!.score)
            reply!.userDownvoted = false
        }
        updateVoteButtons()
    }
    
    private func updateVoteButtons() {
        upvoteButton.selected = reply!.userUpvoted
        downvoteButton.selected = reply!.userDownvoted
    }
}