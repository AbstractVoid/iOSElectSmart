//
//  HomeStoryTableViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class HomeStoryTableViewController: UITableViewController {
    
    var stories: [NewsStory] = [NewsStory]()
    var queryTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 166
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    // MARK: Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count + 1
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        dispatch_async(dispatch_get_main_queue(), {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.textLabel!.textColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        })
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("homeQueryCell", forIndexPath: indexPath) as! HomeQueryTableViewCell
            
            queryTextField = cell.searchText
            
            dispatch_async(dispatch_get_main_queue(), {
                cell.selectionStyle = UITableViewCellSelectionStyle.None
            })
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("homeStoryCell", forIndexPath: indexPath) as! HomeStoryTableViewCell
        
            let story = stories[indexPath.row-1]
        
            dispatch_async(dispatch_get_main_queue(), {
                cell.newsStoryTitleLabel.text = story.title
                cell.newsStorySourceLabel.text = story.source
                cell.date = story.date
                cell.newsStoryDateLabel.text = story.date.description
                cell.newsStoryContentLabel.text = story.description
            })
            
            dispatch_async(dispatch_get_main_queue(), {
                if (indexPath.row % 2 == 1) {
                    cell.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.03)
                }
                else {
                    cell.backgroundColor = UIColor.whiteColor()
                }
            })
        
            return cell
        }
    }
    
    // MARK: - Navigation
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if (indexPath.row > 0) {
                let detScene = segue.destinationViewController as! NewsStoryViewController
                
                let selectedStory = self.stories[indexPath.row - 1]
                detScene.url = NSURL(string: selectedStory.url)
                detScene.storyTitle = selectedStory.title
            }
        }
    }
}
