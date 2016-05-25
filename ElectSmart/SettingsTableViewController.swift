//
//  SettingsTableViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let appDataPlist = "AppData.plist"
    let addressDictionaryKey = "AddressDictionary"
    var appDataPlistPath: String = ""
    var addressDictionaryData = [NSObject: AnyObject]()
    
    @IBOutlet weak var currentLocationZipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        formPlistPath()
        retrieveAddress()
        displayAddress()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeLocationButtonPress(sender: AnyObject) {
        self.performSegueWithIdentifier("goToAddressView", sender: self)
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
    
    private func displayAddress() {
        let zip = addressDictionaryData["ZIP"] as? String ?? ""
        currentLocationZipLabel.text = "ZIP: "+zip
    }

    // MARK: Table drawing functions
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
    }
}
