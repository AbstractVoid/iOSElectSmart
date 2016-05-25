//
//  AddressViewController.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 3/13/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit
import CoreLocation
import Contacts

class AddressViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let appDataPlist = "AppData.plist"
    let addressDictionaryKey = "AddressDictionary"
    var appDataPlistPath: String = ""
    
    @IBOutlet weak var addressLineOneLabel: UILabel!
    @IBOutlet weak var addressLineTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formPlistPath()
        findMyLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func clickContinueButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    // MARK: Address data storing methods
    
    private func formPlistPath() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! NSString
        appDataPlistPath = documentsDirectory.stringByAppendingPathComponent(appDataPlist)
    }
    
    private func saveAddress(addressDictionary: [NSObject: AnyObject]) {
        
        let dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        
        let addressDictionaryData = NSKeyedArchiver.archivedDataWithRootObject(addressDictionary)
        
        dict.setObject(addressDictionaryData, forKey: addressDictionaryKey)

        dict.writeToFile(appDataPlistPath, atomically: false)
        let resultDictionary = NSMutableDictionary(contentsOfFile: appDataPlistPath)
        print("Saved Address Dictionary Data is --> \(resultDictionary?.description)")
    }
    
    // MARK: Location-getting functions
    
    private func findMyLocation() {
     
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func displayLocationInfo(placemark: CLPlacemark) {
        locationManager.stopUpdatingLocation()
        
        let addressArray = placemark.addressDictionary!
        let street = addressArray["Street"] as? String ?? ""
        let city = addressArray["City"] as? String ?? ""
        let state = addressArray["State"] as? String ?? ""
        let zip = addressArray["ZIP"] as? String ?? ""
        let ext = addressArray["PostCodeExtension"] as? String ?? ""
        
        addressLineOneLabel.text = street
        addressLineTwoLabel.text = city+", "+state+" "+zip+"-"+ext
        
        saveAddress(addressArray)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) -> Void in
            if (error != nil) {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            if (placemarks!.count > 0) {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
}
