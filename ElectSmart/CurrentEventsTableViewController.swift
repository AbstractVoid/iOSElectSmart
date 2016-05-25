//
//  CurrentEventsTableViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/13/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CurrentEventsTableViewController: UITableViewController {
    
    let stories: [NewsStory] = [NewsStory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Events"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 139.0/255.0, blue: 139.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Define number of rows as the number of elements in stories
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("currentEventCell", forIndexPath: indexPath)
    
        // TODO: Change configuration here so that the proper image/title/URL are set for cell
        // TODO: Have UITableViewCell resize to height of downloaded image (currently set to fixed height)
        
        // Configure the cell
        let imageView = UIImageView(frame: cell.frame)
        let labelView = UILabel()
        
        // Add image BG
        if let checkedUrl = NSURL(string: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150") {
            imageView.contentMode = .ScaleAspectFit
            downloadImage(checkedUrl, imageView: imageView)
        }
        
        // Add text overlay
        drawTitle("News Story Title", labelView: labelView, imageViewToReference: imageView)
        
        // Layer subviews
        self.view.addSubview(imageView)
        self.view.addSubview(labelView)
    
        return cell
    }
    
    // MARK: Drawing text overlay
    
    private func drawTitle(title: String, labelView: UILabel, imageViewToReference: UIImageView) {
        labelView.text = "    "+title
        labelView.font = UIFont(name: "System", size: 17)
        labelView.textColor = UIColor.blackColor()
        labelView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.6)
        labelView.textAlignment = .Left
        labelView.numberOfLines = 1
        labelView.frame = CGRectMake(imageViewToReference.frame.minX, (imageViewToReference.frame.minY+imageViewToReference.frame.height-40), imageViewToReference.frame.width, 40)
    }
    
    // MARK: Loading images into TableView
    
    private func getDataFromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data, response, error) in completion(data: data, response: response, error: error)
        }.resume()
    }
    
    private func downloadImage(url: NSURL, imageView: UIImageView) {
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                imageView.image = UIImage(data: data)
                self.tableView.layoutSubviews()
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detScene = segue.destinationViewController as! NewsStoryViewController
        
        // TODO: Pass real URL and title to next view taken from NewsStory item
        detScene.url = NSURL(string: "https://www.apple.com")
        detScene.storyTitle = "Apple FTW"
        
    }
}
