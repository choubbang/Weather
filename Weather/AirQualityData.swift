//
//  AirQualityData.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 11..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import Alamofire
import CoreLocation
import SwiftyJSON

public class AirQuality {
    
    private let currentBase = "https://api.waqi.info/feed/"

    public func currentDustByCity(name: String, completionHandler: @escaping (_ result: JSON) -> ()) {
        let apiURL = currentBase + "\(name)/?token=11cd99c3c5fc77376913b244e05ac49f0a8a9c45"
        
        Alamofire.request(apiURL).responseJSON { (response) in
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                
                completionHandler(json)
            } else {
                print("error")
            }
        }
    }
    
    public func currentDustByCoordinates(coords: CLLocationCoordinate2D, completionHandler: @escaping (_ result: JSON) -> ()) {
        let apiURL = currentBase + "geo:\(coords.latitude);\(coords.longitude)/?token=11cd99c3c5fc77376913b244e05ac49f0a8a9c45"
        
        Alamofire.request(apiURL).responseJSON { (response) in
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                
                completionHandler(json)
            } else {
                print("error")
            }
        }
    }
    
    
    
}
