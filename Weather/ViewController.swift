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

class ViewController: UIViewController {
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var ConditionLabel: UILabel!
    
    @IBOutlet weak var WeatherImage: UIImageView!
    
    @IBOutlet weak var DustConditionLabel: UILabel!

    
    @IBAction func RefreshButton(_ sender: Any) {
        currentWeather()
    }
    
    var newApi = OpenWeatherSwift(apiKey: "7d872044b2fa580d43b45a2e4bf536a3", temperatureFormat: .Celsius, lang: .Korea)
    
    func currentWeather() {
        
        var GetId: String? = "1838519"
        self.LocationLabel.text = "부산광역시"
        
        newApi.currentWeatherByID(id: GetId!) { (results) in
            let weather = Weather(data: results)
            
            self.TempLabel.text = "\(weather.temperature)°C" as String
            self.ConditionLabel.text = "\(weather.description)" as String
            self.WeatherImage.image = self.newApi.getIconFromID(id: weather.icon)

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentWeather()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

