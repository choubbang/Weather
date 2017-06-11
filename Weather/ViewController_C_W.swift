//
//  ViewController_C_W.swift
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

class ViewController_C_W: UIViewController {
    
    @IBOutlet weak var seoulImage: UIImageView!
    @IBOutlet weak var seoulLabel: UILabel!
    
    @IBOutlet weak var IncheonImage: UIImageView!
    @IBOutlet weak var IncheonLabel: UILabel!
    
    @IBOutlet weak var suwonImage: UIImageView!
    @IBOutlet weak var suwonLabel: UILabel!
    
    @IBOutlet weak var chuncheonImage: UIImageView!
    @IBOutlet weak var chuncheonLabel: UILabel!
    
    @IBOutlet weak var gnImage: UIImageView!
    @IBOutlet weak var gnLabel: UILabel!
    
    @IBOutlet weak var cheongjuImage: UIImageView!
    @IBOutlet weak var cheongjuLabel: UILabel!
    
    @IBOutlet weak var daejeonjuImage: UIImageView!
    @IBOutlet weak var daejeonjuLabel: UILabel!
    
    @IBOutlet weak var andongjuImage: UIImageView!
    @IBOutlet weak var andongjuLabel: UILabel!
    
    @IBOutlet weak var daeguImage: UIImageView!
    @IBOutlet weak var daeguLabel: UILabel!
    
    @IBOutlet weak var ulsanImage: UIImageView!
    @IBOutlet weak var ulsanLabel: UILabel!
    
    @IBOutlet weak var pusanImage: UIImageView!
    @IBOutlet weak var pusanLabel: UILabel!
    
    @IBOutlet weak var jeonjuImage: UIImageView!
    @IBOutlet weak var jeonjuLabel: UILabel!
    
    @IBOutlet weak var gwangjuImage: UIImageView!
    @IBOutlet weak var gwangjuLabel: UILabel!
    
    @IBOutlet weak var mokpoImage: UIImageView!
    @IBOutlet weak var mokpoLabel: UILabel!
    
    @IBOutlet weak var yeosuImage: UIImageView!
    @IBOutlet weak var yeosuLabel: UILabel!
    
    @IBOutlet weak var jejuImage: UIImageView!
    @IBOutlet weak var JejuLabel: UILabel!
    
    @IBAction func RefreshButton(_ sender: Any) {
        currentWeather()
    }
    
    

    
    
    var newApi = OpenWeatherSwift(apiKey: "7d872044b2fa580d43b45a2e4bf536a3", temperatureFormat: .Celsius, lang: .Korea)
    
    func currentWeather() {
        
        var seoulId: String? = "1835848"
        
        newApi.currentWeatherByID(id: seoulId!) { (results) in
            let weather = Weather(data: results)

            self.seoulImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.seoulLabel.text = "서울 \(weather.temperature)°" as String
            
        }
        
        var incheonId: String? = "1843564"
        
        newApi.currentWeatherByID(id: incheonId!) { (results) in
            let weather = Weather(data: results)
            
            self.IncheonImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.IncheonLabel.text = "인천 \(weather.temperature)°" as String
            
        }
        
        var suwonId: String? = "1835553"
        
        newApi.currentWeatherByID(id: suwonId!) { (results) in
            let weather = Weather(data: results)
            
            self.suwonImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.suwonLabel.text = "수원 \(weather.temperature)°" as String
            
        }
        
        var chuncheonId: String? = "1845136"
        
        newApi.currentWeatherByID(id: chuncheonId!) { (results) in
            let weather = Weather(data: results)
            
            self.chuncheonImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.chuncheonLabel.text = "춘천 \(weather.temperature)°" as String
            
        }
        
        var gnId: String? = "1843137"
        
        newApi.currentWeatherByID(id: gnId!) { (results) in
            let weather = Weather(data: results)
            
            self.gnImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.gnLabel.text = "강릉 \(weather.temperature)°" as String
            
        }
        
        var cheongjuId: String? = "1845604"
        
        newApi.currentWeatherByID(id: cheongjuId!) { (results) in
            let weather = Weather(data: results)
            
            self.cheongjuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.cheongjuLabel.text = "청주 \(weather.temperature)°" as String
            
        }
        
        var daejeonId: String? = "1835235"
        
        newApi.currentWeatherByID(id: daejeonId!) { (results) in
            let weather = Weather(data: results)
            
            self.daejeonjuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.daejeonjuLabel.text = "대전 \(weather.temperature)°" as String
            
        }
        
        var andongId: String? = "1846986"
        
        newApi.currentWeatherByID(id: andongId!) { (results) in
            let weather = Weather(data: results)
            
            self.andongjuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.andongjuLabel.text = "안동 \(weather.temperature)°" as String
            
        }
        
        var daeguId: String? = "1835329"
        
        newApi.currentWeatherByID(id: daeguId!) { (results) in
            let weather = Weather(data: results)
            
            self.daeguImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.daeguLabel.text = "대구 \(weather.temperature)°" as String
            
        }
        
        var ulsanId: String? = "1833747"
        
        newApi.currentWeatherByID(id: ulsanId!) { (results) in
            let weather = Weather(data: results)
            
            self.ulsanImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.ulsanLabel.text = "울산 \(weather.temperature)°" as String
            
        }
        
        var pusanId: String? = "1838524"
        
        newApi.currentWeatherByID(id: pusanId!) { (results) in
            let weather = Weather(data: results)
            
            self.pusanImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.pusanLabel.text = "부산 \(weather.temperature)°" as String
            
        }
        
        var jeonjuId: String? = "1845457"
        
        newApi.currentWeatherByID(id: jeonjuId!) { (results) in
            let weather = Weather(data: results)
            
            self.jeonjuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.jeonjuLabel.text = "전주 \(weather.temperature)°" as String
            
        }
        
        var gwangjuId: String? = "1841811"
        
        newApi.currentWeatherByID(id: gwangjuId!) { (results) in
            let weather = Weather(data: results)
            
            self.gwangjuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.gwangjuLabel.text = "광주 \(weather.temperature)°" as String
            
        }
        
        var mokpoId: String? = "1841066"
        
        newApi.currentWeatherByID(id: mokpoId!) { (results) in
            let weather = Weather(data: results)
            
            self.mokpoImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.mokpoLabel.text = "목포 \(weather.temperature)°" as String
            
        }
        
        var yeosuId: String? = "1832157"
        
        newApi.currentWeatherByID(id: yeosuId!) { (results) in
            let weather = Weather(data: results)
            
            self.yeosuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.yeosuLabel.text = "여수 \(weather.temperature)°" as String
            
        }
        
        var jejuId: String? = "1846266"
        
        newApi.currentWeatherByID(id: jejuId!) { (results) in
            let weather = Weather(data: results)
            
            self.jejuImage.image = self.newApi.getIconFromID(id: weather.icon)
            self.JejuLabel.text = "제주 \(weather.temperature)°" as String
            
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
