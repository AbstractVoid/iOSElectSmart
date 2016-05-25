//
//  HomeViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/8/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit
import Foundation


class HomeViewController: UIViewController {
    
    let dateFormat : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateStyle = NSDateFormatterStyle.LongStyle
        df.timeStyle = .NoStyle
        return df
    }()
    
    var stories: [NewsStory] = [NewsStory]()
    let nextEvent = Election.getDummyElections()[0]
    
    @IBOutlet weak var nextEventTitleButton: UIButton!
    @IBOutlet weak var nextEventDateLabel: UILabel!
    @IBOutlet weak var storiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_main_queue(), {
            self.title = "Stay Informed"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        })
        
        self.hideKeyboardWhenTappedAround()
        getNextEvent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextElectionButtonPress(sender: AnyObject) {
        self.performSegueWithIdentifier("goToElectionEventView", sender: self)
    }
    
    // MARK: Populate next event
    
    private func getNextEvent() {
        dispatch_async(dispatch_get_main_queue(), {
            self.nextEventTitleButton.setTitle(self.nextEvent.title, forState: .Normal)
            self.nextEventTitleButton.titleLabel!.adjustsFontSizeToFitWidth = true;
            self.nextEventDateLabel.text = "November 8, 2016" //dateFormat.stringFromDate(nextEvent.date)
        })
    }
    
    // MARK: Populating stories array
    
    private func getStories() {
        
        let testAPI:BingTask = BingTask(query: nextEvent.title)
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            testAPI.makeRequest() { responseObject, error in
                for story in responseObject! {
                    self.stories.append(story)
                }
            }
        }
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "goToElectionEventView") {
            let vc = segue.destinationViewController as! ElectionEventViewController
            
            vc.electionDate = nextEventDateLabel.text
            vc.electionTitle = nextEventTitleButton.titleLabel?.text
            vc.election = nextEvent
        
        } else {
            let vc = segue.destinationViewController as! HomeStoryTableViewController
            
            let testAPI:BingTask = BingTask()
            testAPI.makeRequest() { responseObject, error in
                if (responseObject?.count > 0){
                for story in responseObject! {
                    self.stories.append(story)
                }
                vc.stories = self.stories
                vc.tableView.reloadData()
                } else {
                    print("We didn't get the right data returned")
                }
            }
            vc.tableView.reloadData()
        }
    }
}