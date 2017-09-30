//
//  LetsStartViewController.swift
//  Chatty
//
//  Created by Arjun on 9/30/17.
//  Copyright © 2017 innovation.llc. All rights reserved.
//

import UIKit
import CoreLocation
class LetsStartViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPostCode: UITextField!
     var locationManager: CLLocationManager!

    var postalCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()

         determineMyCurrentLocation()
    }
       
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
       
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
     
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
                CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)-> Void in
                    if error != nil {
        
                        return
                    }
        
                    if (placemarks?.count)! > 0 {
                        let placemark = placemarks?[0]
                        self.locationManager.stopUpdatingLocation()
                        self.postalCode = (placemark?.postalCode != nil) ? (placemark?.postalCode!)! : ""
                        self.txtPostCode.text = self.postalCode
                    }else{
                       
                    }
                })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

}
