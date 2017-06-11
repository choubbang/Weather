//
//  Set_Location.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 11..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import CoreLocation
import MapKit

class Set_Location: UIViewController {

    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
