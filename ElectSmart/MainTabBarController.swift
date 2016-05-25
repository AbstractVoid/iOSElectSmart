//
//  MainTabBarController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/13/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let appDataPlist = "AppData.plist"
    let addressDictionaryKey = "AddressDictionary"
    var appDataPlistPath: String = ""
    var addressDictionaryData = [NSObject: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formPlistPath()
        retrieveAddress()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let zip = addressDictionaryData["ZIP"] as? String ?? ""
        if (zip.isEmpty) {
            self.performSegueWithIdentifier("goToAddressView", sender: self)
        }
    }
    
    // MARK: Address retrieving methods
    
    private func formPlistPath() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! NSString
        appDataPlistPath = documentsDirectory.stringByAppendingPathComponent(appDataPlist)
    }
    
    private func retrieveAddress() {
        
        let fileManager = NSFileManager.defaultManager()
        
        if(!fileManager.fileExistsAtPath(appDataPlistPath)) {
            if let bundlePath = NSBundle.mainBundle().pathForResource("AppData", ofType: "plist") {
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: appDataPlistPath)
                } catch {
                    // TODO: Some error handling here?
                    print("Something went wrong")
                }
            }
        }
        
        let myDict = NSDictionary(contentsOfFile: appDataPlistPath)
        if let dict = myDict {
            if let addressDictionaryValue = dict.objectForKey(addressDictionaryKey) as? NSData {
                addressDictionaryData = NSKeyedUnarchiver.unarchiveObjectWithData(addressDictionaryValue) as! [NSObject: AnyObject]
                print("Retrieved Address Dictionary Data is --> \(addressDictionaryData.description)")
            }
        }
    }
}
