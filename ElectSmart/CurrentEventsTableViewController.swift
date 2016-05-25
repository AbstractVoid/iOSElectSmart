//
//  CurrentEventsTableViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/13/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CurrentEventsTableViewController: UITableViewController {
    
    var stories: [NewsStory] = [NewsStory]()
    var queryTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Events"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.getStories()
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 166
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Populating stories array
    
    private func getStories() {
        
        let testAPI:BingTask = BingTask()
        testAPI.makeRequest() { responseObject, error in
            if (responseObject?.count > 0){
                for story in responseObject! {
                    self.stories.append(story)
                }
                self.tableView.reloadData()
            } else {
                print("We didn't get the right data returned")
            }
        }
        self.tableView.reloadData()
    }
    
    @IBAction func searchWithQuery(sender: AnyObject) {
        
        let query = self.queryTextField!.text!
        
        if (query.characters.count > 0) {
            stories.removeAll()
            
            NSOperationQueue.mainQueue().addOperationWithBlock {
                let queryTask: BingTask = BingTask(query: query)
                queryTask.makeRequest() { responseObject, error in
                    if (responseObject?.count > 0){
                        for story in responseObject! {
                            self.stories.append(story)
                        }
                        self.tableView.reloadData()
                    } else {
                        print("We didn't get the right data returned")
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Define number of rows as the number of elements in stories
        return stories.count+1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Different behavior for header cell with search query
        if (indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("currentEventQueryCell", forIndexPath: indexPath) as! CurrentEventsTableViewHeaderCell
            
            queryTextField = cell.queryTextField
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("currentEventCell", forIndexPath: indexPath) as! CurrentEventsTableViewCell
            
            // get story for cell
            let story: NewsStory = self.stories[indexPath.row-1]
            
            cell.currentEventTitleLabel.text = story.title
            cell.currentEventSourceLabel.text = story.source
            cell.date = story.date
            cell.currentEventDateLabel.text = story.date.description
            cell.currentEventContentLabel.text = story.description
            
            if (indexPath.row % 2 == 1) {
                cell.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.03)
            }
            else {
                cell.backgroundColor = UIColor.whiteColor()
            }
            
            return cell
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if (indexPath.row > 0) {
                let detScene = segue.destinationViewController as! NewsStoryViewController
                
                let selectedStory = self.stories[indexPath.row-1]
                detScene.url = NSURL(string: selectedStory.url)
                detScene.storyTitle = selectedStory.title
            }
        }
    }
}
