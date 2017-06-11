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
import AddressBookUI

class Set_Location: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double)-> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        return pLocation
    }
    
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        self.locationManager.stopUpdatingLocation()
    }
}
