//
//  UpcomingViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/8/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Collection view containing cells of elections
    @IBOutlet weak var collectionView: UICollectionView!
    
    //TODO: fill in with election data
    let titles = ["Ohio Caucus", "Wisconsin Caucus"]
    let dates = ["March 15", "April 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Upcoming Dates"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 139.0/255.0, blue: 139.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UpcomingElectionCollectionViewCell
        cell.backgroundColor = UIColor.redColor()
        
        cell.title?.text = self.titles[indexPath.row]
        cell.date?.text = self.dates[indexPath.row]
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showElection", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showElection" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! ElectionEventViewController
            
            //TODO: Setup election view
        }
    }
    
    
    
    
    
    
    

}

