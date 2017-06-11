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

class ViewController_TT_W: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tbleJSON: UITableView!
    
    var newApi = OpenWeatherSwift(apiKey: "7d872044b2fa580d43b45a2e4bf536a3", temperatureFormat: .Celsius, lang: .Korea)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherTableViewCell
        
        let GetId: String? = "1838519"
        
        newApi.forecastWeatherByID(id: GetId!, type: .Hourly) { (results) in
            let forecast = Forecast(data: results, type: .Hourly)
            let countTemp = indexPath.row
            
            cell.TempConditionLabel.text = "\(forecast.temperatures[countTemp])°C" as String
            cell.UpdateDateLabel.text = "\(forecast.dates[countTemp])" as String
            
            cell.WeatherImage.image = self.newApi.getIconFromID(id: forecast.icon[countTemp])
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

