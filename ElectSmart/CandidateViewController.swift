//
//  CandidateViewController.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/4/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CandidateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var candidateTable: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var candidate: Candidate?
    var candidateBio: CandidateBio?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        candidateTable.dataSource = self
        candidateTable.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToDiscussionForumButton(sender: AnyObject) {
        self.performSegueWithIdentifier("goToDiscussionForum", sender: self)
    }
    
    
    // MARK: Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("candidateHeaderCell", forIndexPath: indexPath) as! CandidateHeaderTableViewCell
            
            // TODO: CHANGE
            cell.candidateNameLabel.text = candidate!.name
            
            // TODO: Edit candidate photo
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
                cell.candidateImageView.image = UIImage(data: data)
            }
            
            return cell
            
        } else if (indexPath.row == 1) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("bioCell", forIndexPath: indexPath) as! CandidateBioTableViewCell
            
            // TODO: CHANGE
            if candidate!.name == "Sen. Bernie Sanders" {
                //cell.bioLabel.text = "Bernard \"Bernie\" Sanders is an American politician and the junior United States senator from Vermont. He is a candidate for the Democratic nomination for President of the United States in the 2016 election."
                cell.bioLabel.text = "Bernard \"Bernie\" Sanders is an American politician and the junior United States senator from Vermont. He is a candidate for the Democratic nomination for President of the United States in the 2016 election. A member of the Democratic Party since 2015, Sanders had been the longest-serving independent in U.S. congressional history, though his caucusing with the Democrats entitled him to committee assignments and at times gave Democrats a majority. Sanders became the ranking minority member on the Senate Budget Committee in January 2015; he had previously served for two years as chair of the Senate Veterans' Affairs Committee."
            } else if candidate!.name == "Hillary Clinton" {
                //cell.bioLabel.text = "Hillary Diane Rodham Clinton /ˈhɪləri daɪˈæn ˈrɒdəm ˈklɪntən/ is an American politician and a candidate for the Democratic presidential nomination in the 2016 election."
                cell.bioLabel.text = "Hillary Diane Rodham Clinton is a former United States Secretary of State, U.S. Senator, and First Lady of the United States. From 2009 to 2013, she was the 67th Secretary of State, serving under President Barack Obama. She previously represented New York in the U.S. Senate. Before that, as the wife of President Bill Clinton, she was First Lady from 1993 to 2001. In the 2008 election, Clinton was a leading candidate for the Democratic presidential nomination."
            } else if candidate!.name == "Donald Trump" {
                //cell.bioLabel.text = "Donald John Trump is an American businessman, politician, television personality, author, and the presumptive nominee of the Republican Party for President of the United States in the 2016 election."
                cell.bioLabel.text = "Donald John Trump is an American businessman, politician, television personality, author, and the presumptive nominee of the Republican Party for President of the United States in the 2016 election. Trump is the Chairman and President of The Trump Organization, as well as the founder of the gaming and hotel enterprise, Trump Entertainment Resorts, now owned by Carl Icahn."
            } else if candidate!.name == "Gov. John Kasich" {
                //cell.bioLabel.text = "John Richard Kasich is an American politician and the current governor of Ohio, first elected in 2010 and re-elected in 2014."
                cell.bioLabel.text = "John Richard Kasich is an American politician and the current governor of Ohio, first elected in 2010 and re-elected in 2014. Kasich served nine terms as a member of the United States House of Representatives, representing Ohio's 12th congressional district from 1983 to 2001. His tenure in the House included 18 years on the House Armed Services Committee and six years as chairman of the House Budget Committee. He was a key figure in the passage of both welfare reform and the Balanced Budget Act of 1997."
            } else if candidate!.name == "Sen. Ted Cruz" {
               // cell.bioLabel.text = "Rafael Edward \"Ted\" Cruz is an American politician and the junior United States Senator from Texas. Cruz graduated from Princeton University in 1992 and from Harvard Law School in 1995."
                 cell.bioLabel.text = "Rafael Edward \"Ted\" Cruz is an American politician and the junior United States Senator from Texas. Cruz graduated from Princeton University in 1992 and from Harvard Law School in 1995. Between 1999 and 2003, he was the Director of the Office of Policy Planning at the Federal Trade Commission, an Associate Deputy Attorney General at the United States Department of Justice, and domestic policy advisor to George W. Bush on the 2000 George W. Bush presidential campaign. He served as Solicitor General of Texas, from 2003 to 2008, appointed by Texas Attorney General, Greg Abbott. He was the first Hispanic, and the longest-serving, Solicitor General in Texas history. From 2004 to 2009, Cruz was also an adjunct professor at the University of Texas School of Law in Austin, where he taught U.S. Supreme Court litigation."
            }
            
            return cell
            
        }   else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("discussionCell", forIndexPath: indexPath)
            
            // configure cell here
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 240
        } else if (indexPath.row == 1){
            return 300
        } else {
            return 300
        }
    }

}
