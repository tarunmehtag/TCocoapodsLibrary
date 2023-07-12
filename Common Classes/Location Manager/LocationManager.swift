//
//  LocationManager.swift
//  Abstract Class Demo
//
//  Created by Mobile on 05/04/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject , CLLocationManagerDelegate {

    static let shared = LocationManager()
    var locationManage = CLLocationManager()
    var currentLocation : CLLocationManager? = nil
    var viewController: UIViewController?
    var currentLocationCallback : ((CLLocation) -> ())?
    
    override init() {
        super.init()
        locationManage.delegate = self
        locationManage.requestWhenInUseAuthorization()
    }
    
    //MARK: Get Current Loaction
    func getCurrentLocation(_ viewController: UIViewController, _ callback: @escaping ((CLLocation) -> ())) {
        self.viewController = viewController
        currentLocationCallback = callback
    }

    //MARK: CLLocation Delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManage.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        currentLocationCallback?(location)
    }
    
}

//MARK: How to use

/*
 Info.Plist
 <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 <string></string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string></string>
 <key>NSLocationUsageDescription</key>
 <string></string>

 Use In Class
 LocationManager.shared.getCurrentLocation(self) { (location) in
 print(location)
 }
 */
