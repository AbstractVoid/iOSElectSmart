//
//  DisqusDiscussionRepliesTableViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/6/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class DisqusDiscussionRepliesTableViewController: UITableViewController {
    
    var discussion: Discussion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = discussion!.content
        
        let button = UIBarButtonItem(title: "Reply", style: .Plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = button
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (discussion?.replies.count)!+1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Header cell is the Discussion Post
        if (indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("discussionCell", forIndexPath: indexPath) as! DisqusDiscussionRepliesTableViewHeaderCell
            
            // get number of days passed since post
            let today = NSDate()
            let cal = NSCalendar.currentCalendar()
            let unit: NSCalendarUnit = .Day
            let components = cal.components(unit, fromDate: discussion!.datePosted, toDate: today, options: [])
            
            cell.contentLabel.text = discussion!.content
            cell.dateLabel.text = String(components.day)+" days ago"
            cell.repliesLabel.text = String(discussion!.replies.count)+" replies"
            cell.scoreLabel.text = String(discussion!.score)
            
            cell.discussion = discussion
            
            return cell
        }
        // Next cells are all responses to discussion
        else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("replyCell", forIndexPath: indexPath) as! DisqusDiscussionRepliesTableViewReplyCell
            
            if (indexPath.row%2 == 1) {
                cell.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.1)
            }
            
            // get current reply
            let reply: DiscussionReply = self.discussion!.replies[indexPath.row-1]
            
            // get number of days passed since reply
            let today = NSDate()
            let cal = NSCalendar.currentCalendar()
            let unit: NSCalendarUnit = .Day
            let components = cal.components(unit, fromDate: reply.datePosted, toDate: today, options: [])
            
            cell.contentLabel.text = reply.content
            cell.dateLabel.text = String(components.day)+" days ago"
            cell.scoreLabel.text = String(reply.score)
            
            cell.reply = reply
            
            return cell
        }
    }
    
    // MARK: - Navigation
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
}