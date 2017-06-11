//
//  ViewController_Dust.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 11..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import OpenWeatherSwift
import CoreLocation
import MapKit

class ViewController_Dust: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var pm10Image: UIImageView!
    @IBOutlet weak var pm10Label: UILabel!
    @IBOutlet weak var pm10conditionLabel: UILabel!
    
    @IBOutlet weak var pm25Image: UIImageView!
    @IBOutlet weak var pm25Label: UILabel!
    @IBOutlet weak var pm25conditionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func refreshButton(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    var newAQApi = AirQuality()
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
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.newAQApi.currentDustByCoordinates(coords: annotation.coordinate) { (results) in
                
                self.locationLabel.text = address as String
                
                let aqpm25 = Set_PM25(data: results)
                
                var pm10 = aqpm25.pm10
                let pm10imageName: String = self.pm10imageSelection(setpm10: pm10)
                let pm10condition: String = self.pm10conditioneSelection(setpm10: pm10)
                
                var pm25 = aqpm25.pm25
                let pm25imageName: String = self.pm25imageSelection(setpm25: pm25)
                let pm25condition: String = self.pm25conditioneSelection(setpm25: pm25)
                
                self.pm10Image.image = UIImage(named: pm10imageName)
                self.pm10Label.text = "미세먼지\n\(pm10)㎍/㎥" as String
                self.pm10conditionLabel.text = "\(pm10condition)" as String
                
                self.pm25Image.image = UIImage(named: pm25imageName)
                self.pm25Label.text = "초미세먼지\n\(pm25)㎍/㎥" as String
                self.pm25conditionLabel.text = "\(pm25condition)" as String
                
                self.dateLabel.text = "\(aqpm25.date)" as String
                
            }
        })
        locationManager.stopUpdatingLocation()
    }
    
    
    func pm10imageSelection (setpm10: Int) -> String {
        
        var imageName: String = ""
        
        if setpm10 <= 54 {
            imageName = "AQI_1.png"
        } else if setpm10 <= 154 {
            imageName = "AQI_2.png"
        } else if setpm10 <= 254 {
            imageName = "AQI_3.png"
        } else if setpm10 <= 354 {
            imageName = "AQI_4.png"
        } else if setpm10 <= 424 {
            imageName = "AQI_5.png"
        } else {
            imageName = "AQI_6.png"
        }
        
        
        return imageName
    }
    
    func pm10conditioneSelection (setpm10: Int) -> String {
        
        var conditionName: String = ""
        
        if setpm10 <= 54 {
            conditionName = "좋음"
        } else if setpm10 <= 154 {
            conditionName = "보통"
        } else if setpm10 <= 254 {
            conditionName = "나쁨"
        } else if setpm10 <= 354 {
            conditionName = "매우나쁨"
        } else if setpm10 <= 424 {
            conditionName = "해로움"
        } else {
            conditionName = "위험"
        }
        
        return conditionName
        
    }
    
    func pm25imageSelection (setpm25: Int) -> String {
        
        var imageName: String = ""
        
        if setpm25 < 12 {
            imageName = "AQI_1.png"
        } else if setpm25 < 35 {
            imageName = "AQI_2.png"
        } else if setpm25 < 55 {
            imageName = "AQI_3.png"
        } else if setpm25 < 150 {
            imageName = "AQI_4.png"
        } else if setpm25 < 250 {
            imageName = "AQI_5.png"
        } else {
            imageName = "AQI_6.png"
        }
        
        
        return imageName
    }
    
    func pm25conditioneSelection (setpm25: Int) -> String {
        
        var conditionName: String = ""
        
        if setpm25 < 12 {
            conditionName = "좋음"
        } else if setpm25 < 35 {
            conditionName = "보통"
        } else if setpm25 < 55 {
            conditionName = "나쁨"
        } else if setpm25 < 150 {
            conditionName = "매우나쁨"
        } else if setpm25 < 250 {
            conditionName = "해로움"
        } else {
            conditionName = "위험"
        }
        
        return conditionName
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
 
}
