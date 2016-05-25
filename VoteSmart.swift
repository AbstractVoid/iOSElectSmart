//
//  VoteSmart.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/28/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

public class VoteSmart {

    let candidateBioUrl = "http://api.votesmart.org/CandidateBio.getBio?key=bbad23b6fa27737fd5b2e4655d4ac334&o=JSON&candidateId=9490"
    
    
    
    
    func makeElectionsRequest(year: String, completionHandler: (elections: [Election]!, error: NSError!) -> ()) {
        let url = NSURL(string: "http://api.votesmart.org/Election.getElectionByYearState?key=bbad23b6fa27737fd5b2e4655d4ac334&o=JSON&year=\(year)")!
        let request = NSURLRequest(URL: url) // create http request
        var elections = [Election]()
        
        // API Call
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{(response: NSURLResponse?, data: NSData?, error: NSError?) ->Void in
            if error == nil {
                //print("no error")
                //use JSON
                let json = JSON(data: data!)
                //print(json)
                //print(json["elections"]["election"])
                    let electionID = json["elections"]["election"]["electionId"].stringValue
                    let title = json["elections"]["election"]["name"].stringValue

                    for stage in json["elections"]["election"]["stage"].arrayValue {
                        let date = stage["electionDate"].string
                        let name = stage["name"].string
                        let stateID = stage["stateId"].string
                        
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let newDate = dateFormatter.dateFromString(date!)
                        
                        let currentTime = NSDate()
                        
                        let dateUpperLimit = currentTime.addDays(+40)
                        let dateLowerLimit = currentTime.addDays(-10)
                        
                        if((newDate?.isGreaterThanDate(dateLowerLimit)) == true && newDate?.isLessThanDate(dateUpperLimit) == true){
                        
                            elections.append(Election(electionID: electionID, title: stateID! + " " + title + " " + name!, date: newDate!, stateID: stateID!))
                        }
                    }
                
            }
            
            completionHandler(elections: elections, error: error)
        })
    }
    
    func makeCandidatesRequest(electionID: String, completionHandler: (candidates: [Candidate]!, error: NSError!) -> ()) {
        
        let url = NSURL(string: "http://api.votesmart.org/Candidates.getByElection?key=bbad23b6fa27737fd5b2e4655d4ac334&o=JSON&electionId=\(electionID)")! //JSON url
        let request = NSURLRequest(URL: url) // create http request
        var candidates = [Candidate]()
        
        // API Call
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{(response: NSURLResponse?, data: NSData?, error: NSError?) ->Void in
            if error == nil {
                //use JSON
                let json = JSON(data: data!)
                
                for candidate in json["candidateList"]["candidate"].arrayValue {
                    
                    let party = candidate["electionParties"].stringValue
                    let name = candidate["ballotName"].stringValue
                    
                    
                    if name == "Hillary Clinton" || name == "Bernie Sanders" || name == "John Kasich" || name == "Rafael Edward 'Ted' Cruz" || name == "Donald Trump" {
                        
                        let candidateID = candidate["candidateId"].stringValue
                    
                        candidates.append(Candidate(candidateID: candidateID, name: name, party: party))
                    }
                }
            }
            
            completionHandler(candidates: candidates, error: error)
        })
    }
    
    func makeCandidateBioRequest(candidateID: String, completionHandler: (candidateBio: CandidateBio!, error: NSError!) -> ()) {
        
        let url = NSURL(string: "http://api.votesmart.org/CandidateBio.getBio?key=bbad23b6fa27737fd5b2e4655d4ac334&o=JSON&candidateId=\(candidateID)")! //JSON url
        let request = NSURLRequest(URL: url) // create http request
        var candidateBio: CandidateBio!
        
        // API Call
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{(response: NSURLResponse?, data: NSData?, error: NSError?) ->Void in
            if error == nil {
                //use JSON
                let json = JSON(data: data!)
                
                let photo = json["bio"]["candidate"]["photo"].stringValue.stringByReplacingOccurrencesOfString("\\", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                
                candidateBio! = CandidateBio(photo: photo)
                
                
            }
            
           completionHandler(candidateBio: candidateBio!, error: error)
        })
    }
    
    
    
    
    
    
    
    
    
    
}