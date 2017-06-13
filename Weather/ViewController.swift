//
//  ViewController.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 5..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import OpenWeatherSwift
import CoreLocation
import MapKit
import AddressBookUI

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var ConditionLabel: UILabel!
    
    @IBOutlet weak var WeatherImage: UIImageView!
    
    @IBOutlet weak var DustImage: UIImageView!
    @IBOutlet weak var DustLabel: UILabel!
    @IBOutlet weak var DustConditionLabel: UILabel!

    
    @IBAction func RefreshButton(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    var newApi = OpenWeatherSwift(apiKey: "7d872044b2fa580d43b45a2e4bf536a3", temperatureFormat: .Celsius, lang: .Korea)
    var newAQApi = AirQuality()
    
    let locationManager = CLLocationManager()
    
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
            
            self.LocationLabel.text = address as String
           
            self.newApi.currentWeatherByCoordinates(coords: annotation.coordinate) { (results) in
                let weather = Weather(data: results)
                
                self.TempLabel.text = "\(weather.temperature)°C" as String
                self.ConditionLabel.text = "\(weather.description)" as String
                self.WeatherImage.image = self.newApi.getIconFromID(id: weather.icon)
                
            }
            
            self.newAQApi.currentDustByCoordinates(coords: annotation.coordinate) { (results) in
                let aqpm25 = Set_PM25(data: results)
                
                var pm10 = aqpm25.pm10
                var condition: String = self.pm10conditioneSelection(setpm10: pm10)
                let imageName: String = self.pm10imageSelection(setpm10: pm10)
                
                self.DustImage.image = UIImage(named: imageName)
                self.DustLabel.text = "미세먼지 : \(pm10)"
                self.DustConditionLabel.text = "\(condition)" as String
            }
            
        })
        locationManager.stopUpdatingLocation()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

