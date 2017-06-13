//
//  ViewController_TT_W.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 6..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import OpenWeatherSwift
import MapKit

class ViewController_TT_W: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    

    @IBOutlet weak var tbleJSON: UITableView!
    
    var newApi = OpenWeatherSwift(apiKey: "7d872044b2fa580d43b45a2e4bf536a3", temperatureFormat: .Celsius, lang: .Korea)
    
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
    
    let annotation = MKPointAnnotation()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        annotation.coordinate = goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherTableViewCell

        locationManager.startUpdatingLocation()
        
    
        self.newApi.forecastWeatherByCoordinates(coords: annotation.coordinate, type: .Hourly) { (results) in
            let forecast = Forecast(data: results, type: .Hourly)
            
            var countTemp = indexPath.row
            
            cell.TempConditionLabel.text = "\(forecast.temperatures[countTemp])°C" as String
            cell.UpdateDateLabel.text = "\(forecast.dates[countTemp])" as String
            
            cell.WeatherImage.image = self.newApi.getIconFromID(id: forecast.icon[countTemp])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

