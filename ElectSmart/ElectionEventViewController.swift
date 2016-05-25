//
//  ElectionEventViewController.swift
//  ElectSmart
//
//  Created by Conner Christianson on 3/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class ElectionEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var electionTable: UITableView!
    
    var election: Election?
    var electionDate: String?
    var electionTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        electionTable.dataSource = self
        electionTable.delegate = self
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            
            //self.election!.candidates.append(test)
            self.election!.candidates.append(Candidate(candidateID: "1", name: "Gov. John Kasich", party: "Republican"))
            self.election!.candidates.append(Candidate(candidateID: "2", name: "Donald Trump", party: "Republican"))
            self.election!.candidates.append(Candidate(candidateID: "3", name: "Sen. Ted Cruz", party: "Republican"))
            self.election!.candidates.append(Candidate(candidateID: "4", name: "Hillary Clinton", party: "Democrat"))
            self.election!.candidates.append(Candidate(candidateID: "5", name: "Sen. Bernie Sanders", party: "Democrat"))
            dispatch_async(dispatch_get_main_queue(), {
                self.electionTable.reloadData()
            })
            
            /*
        let voteSmart: VoteSmart = VoteSmart()
        voteSmart.makeCandidatesRequest((self.election?.electionID)!) { responseObject, error in
            if(responseObject?.count > 0){
                for candidate in responseObject!{
                    self.election!.candidates.append(candidate)
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.electionTable.reloadData()
                })
                
            } else {
                print("error in getting candidates")
            }
        } */
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Table View
    
    
    // The amount of candidates + 1 for the header cell
    //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.election!.candidates.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Header cell, there should only be one
        //
        if (indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! ElectionHeaderTableViewCell
            
            dispatch_async(dispatch_get_main_queue(), {
            
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
            
                cell.electionTitle.text = self.election!.title
                cell.electionDate.text = dateFormatter.stringFromDate(self.election!.date)
                
            })
            
            return cell
            
            // List of candidates
            //
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("candidateCell", forIndexPath: indexPath) as! ElectionCandidateTableViewCell
            
            // TODO: CHANGE
            //let url = NSURL(string: election!.candidates![indexPath.row - 1].photo)
            //let data = NSData(contentsOfURL:url!)
            
            //if (data != nil) {
            //    cell.candidateImage.image = UIImage(data:data!)
            //}
            
            dispatch_async(dispatch_get_main_queue(), {
                cell.candidateName!.text = self.election!.candidates[indexPath.row - 1].name
                //cell.candidateDescription.text = election!.candidates![indexPath.row - 1].bio
                cell.candidateDescription!.editable = false
                cell.candidateDescription!.selectable = false
                
                let candidate = self.election?.candidates[indexPath.row-1]
                
                if candidate!.name == "Sen. Bernie Sanders" {
                    cell.candidateDescription!.text = "Bernard \"Bernie\" Sanders is an American politician and the junior United States senator from Vermont. He is a candidate for the Democratic nomination for President of the United States in the 2016 election."
                } else if candidate!.name == "Hillary Clinton" {
                    cell.candidateDescription!.text = "Hillary Diane Rodham Clinton /ˈhɪləri daɪˈæn ˈrɒdəm ˈklɪntən/ is an American politician and a candidate for the Democratic presidential nomination in the 2016 election."
                } else if candidate!.name == "Donald Trump" {
                    cell.candidateDescription!.text = "Donald John Trump is an American businessman, politician, television personality, author, and the presumptive nominee of the Republican Party for President of the United States in the 2016 election."
                    
                } else if candidate!.name == "Gov. John Kasich" {
                    cell.candidateDescription!.text = "John Richard Kasich is an American politician and the current governor of Ohio, first elected in 2010 and re-elected in 2014."
                } else if candidate!.name == "Sen. Ted Cruz" {
                    cell.candidateDescription!.text = "Rafael Edward \"Ted\" Cruz is an American politician and the junior United States Senator from Texas. Cruz graduated from Princeton University in 1992 and from Harvard Law School in 1995."
                }
                
                var url : String!
                if candidate!.name == "Sen. Bernie Sanders" {
                    url = "http://static.votesmart.org/canphoto/27110.jpg"
                } else if candidate!.name == "Hillary Clinton" {
                    url = "http://static.votesmart.org/canphoto/55463.jpg"
                } else if candidate!.name == "Donald Trump" {
                    url = "http://static.votesmart.org/canphoto/15723.jpg"
                } else if candidate!.name == "Gov. John Kasich" {
                    url = "http://static.votesmart.org/canphoto/27017.jpg"
                } else if candidate!.name == "Sen. Ted Cruz" {
                    url = "http://static.votesmart.org/canphoto/135705.jpg"
                }
                
                let NSurl = NSURL(string: url!)
                
                if let data = NSData(contentsOfURL: NSurl!) {
                    cell.candidateImage.image = UIImage(data: data)
                }
                
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (indexPath.row == 0) {
            return 180
        } else {
            return 100
        }
    }

    
    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            
            let vc = segue.destinationViewController as! PollingPlaceViewController
            
            // TODO: Get polling address
            let address: String = "5 Embarcadero Center, San Francisco, CA 94111"
            
            vc.pollingAddress = address
            
            
        } else if segue.identifier == "showCandidate" {
            
            let detScene = segue.destinationViewController as! CandidateViewController
            
            if let indexPath = self.electionTable.indexPathForSelectedRow {
                let selectedCandidate = self.election?.candidates[indexPath.row-1]
                detScene.candidate = selectedCandidate
            }
        }
    }
    
}
