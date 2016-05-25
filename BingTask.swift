//
//  BingTask.swift
//  ElectSmart
//
//  Created by Nick on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

extension String
{
    func fromBase64() -> String
    {
        let data = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions(rawValue: 0))
        return String(data: data!, encoding: NSUTF8StringEncoding)!
    }
    
    func toBase64() -> String
    {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)
        return data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
}

public class BingTask{
    
    let newsurl:String
    let keyString:String = "fDs4/JuSlVn0HIG0tp4QaQwxuLnfe35r8Kq6ej51RL0:fDs4/JuSlVn0HIG0tp4QaQwxuLnfe35r8Kq6ej51RL0"
    
    let keyEncoded:String
    
    init(){
        keyEncoded = keyString.toBase64()
        newsurl = "https://api.datamarket.azure.com/Bing/Search/v1/News?Query=%27US%20Presidential%20Election%27&$format=JSON&$top=10"
    }
    init(query: String){
        keyEncoded = keyString.toBase64()
        let q = query.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        newsurl = "https://api.datamarket.azure.com/Bing/Search/v1/News?Query=%27"+q!+"%27&$format=JSON&$top=10"
    }
    
    //let title: String
    //let ID: int
    //let url: String
    //let date: NSDate
    //let source: String
    //let description: String
    
    func makeRequest(completionHandler: ([NewsStory]?, String?) -> ()) {
        makeNewsRequest(completionHandler)
    }
    
    func makeNewsRequest(completionHandler: ([NewsStory]?, String?) -> ()) {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        var stories: [NewsStory] = [NewsStory]()
        
        let headers = ["Authorization": "Basic \(keyEncoded)"]
        Alamofire.request(.GET, newsurl, parameters: nil, encoding: .JSON, headers: headers)
            .responseJSON{ response in
                guard response.2.error == nil else {
                    print("error" + response.2.error.debugDescription + " code was " + response.2.debugDescription)
                    
                    completionHandler(nil, response.2.debugDescription)
                    return
                }
                
                if let value: AnyObject = response.2.value {
                    //handle the returned JSON
                    let responseValue = JSON(value)
                    //Handle parsing of results
                    //print("Response was" + responseValue.description)
                    
                    
                    
                    
                    //for each News item, populate data models
                    for item in responseValue["d"]["results"].arrayValue {
                        let title = item["Title"].stringValue
                        let ID = item["ID"].stringValue
                        let url = item["Url"].stringValue
                        let dateText:String = item["Date"].stringValue
                        let date: NSDate = formatter.dateFromString(dateText)!
                        let source = item["Source"].stringValue
                        let description = item["Description"].stringValue
                        
                        stories.append(NewsStory(title: title, ID: ID, url: url, date: date, source: source, description: description))
                       /* print(title)
                        print(ID)
                        print(url)
                        print(date)
                        print(source)
                        print(description)*/
                        
                    }
                   
                    
                }
                    completionHandler(stories as [NewsStory], nil)
    
                }
        
    }
    
    
}

