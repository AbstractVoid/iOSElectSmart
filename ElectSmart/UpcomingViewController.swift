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
    
    var electionData: [Election] = []
    
    let dateFormat : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateStyle = NSDateFormatterStyle.LongStyle
        df.timeStyle = .NoStyle
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_main_queue()){
            self.title = "Upcoming Dates"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        }
        
        self.collectionView.dataSource = self
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
        let voteSmart: VoteSmart = VoteSmart()
        voteSmart.makeElectionsRequest("2016") { responseObject, error in
            if(responseObject?.count > 0){
                for election in responseObject!{
                    self.electionData.append(election)
                }
                self.electionData.sortInPlace { $0.date.compare($1.date) == .OrderedAscending }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.collectionView.reloadData()
                })
                
            } else {
                print("error in getting elections")
            }
        }
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.electionData.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UpcomingElectionCollectionViewCell
        
        dispatch_async(dispatch_get_main_queue(), {
            cell.title?.text = self.dateFormat.stringFromDate(self.electionData[indexPath.row].date)
            //cell.title?.text = electionData[indexPath.row].date
            cell.date?.text = self.electionData[indexPath.row].title
        })
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showElection", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showElection" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destinationViewController as! ElectionEventViewController
            
            vc.election = electionData[indexPath.row]
            
        }
    }

}

