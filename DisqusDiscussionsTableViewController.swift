//
//  DisqusDiscussionsTableViewController.swift
//  ElectSmart
//
//  Created by Nick on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class DisqusDiscussionsTableViewController: UITableViewController {
    
    let disqusManager = DisqusManager()
    var discussions = [Discussion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Discussions"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        let button = UIBarButtonItem(title: "New Post", style: .Plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = button
        
        // TODO: Remove this and replace with real discussion posts
        discussions.append(Discussion(content: "Let's talk about that wall tho"))
        discussions.append(Discussion(content: "Is Kasich still in the running????"))
        discussions.append(Discussion(content: "The Brooklyn debate was lit am I right?"))
        discussions[0].addReply("It's gonna be crazy")
        discussions[0].addReply("Kind of into it tbh")
        discussions[0].addReply("Make Drumpf build it on his own")
        discussions[1].addReply("Who gives a f")
        discussions[1].addReply("Who???")
        discussions[2].addReply("Yeah nice")
        discussions[2].addReply("Didn't watch it")
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
        return discussions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("discussionPostCell", forIndexPath: indexPath) as! DisqusDiscussionsTableViewCell
        
        if (indexPath.row%2 == 1) {
            cell.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.1)
        }
        
        // get current discussion
        let discussion: Discussion = self.discussions[indexPath.row]
        
        // get number of days passed since post
        let today = NSDate()
        let cal = NSCalendar.currentCalendar()
        let unit: NSCalendarUnit = .Day
        let components = cal.components(unit, fromDate: discussion.datePosted, toDate: today, options: [])

        cell.contentLabel.text = discussion.content
        cell.dateLabel.text = String(components.day)+" days ago"
        cell.repliesLabel.text = String(discussion.replies.count)+" replies"
        cell.scoreLabel.text = String(discussion.score)
        
        cell.discussion = discussion
        
        return cell
    }
    
    // MARK: - Disqus functions
    
    func showNewPostForm(onSuccess: () -> ()) {
        if disqusManager.isUserAuthenticated() {
            // Succeed
            onSuccess()
        } else {
            // Authenticate user
            let vc = DisqusAuthenticateViewController()
            vc.onSuccess = onSuccess
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = UIModalPresentationStyle.FormSheet
            self.presentViewController(navigationController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detScene = segue.destinationViewController as! DisqusDiscussionRepliesTableViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedDiscussion = self.discussions[indexPath.row]
            detScene.discussion = selectedDiscussion
        }
    }
}

protocol DisqusComments {
    func presentNewPostForm()
}
