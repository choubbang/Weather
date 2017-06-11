//
//  ViewController_DTile.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 7..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ViewController_DTile: UIViewController {
    
    @IBOutlet weak var seoulImage: UIImageView!
    @IBOutlet weak var seoulLabel: UILabel!
    
    @IBOutlet weak var IncheonImage: UIImageView!
    @IBOutlet weak var IncheonLabel: UILabel!
    
    @IBOutlet weak var suwonImage: UIImageView!
    @IBOutlet weak var suwonLabel: UILabel!
    
    @IBOutlet weak var chuncheonImage: UIImageView!
    @IBOutlet weak var chuncheonLabel: UILabel!
 
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
    
    @IBOutlet weak var yeosuImage: UIImageView!
    @IBOutlet weak var yeosuLabel: UILabel!
    
    @IBOutlet weak var jejuImage: UIImageView!
    @IBOutlet weak var JejuLabel: UILabel!
    
    
    @IBAction func refreshButton(_ sender: Any) {
        currentDust()
    }
    
    var newAQApi = AirQuality()
    
    func currentDust() {
        
        newAQApi.currentDustByCity(name: "seoul") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.seoulImage.image = UIImage(named: imageName)
            self.seoulLabel.text = "서울 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "incheon") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.IncheonImage.image = UIImage(named: imageName)
            self.IncheonLabel.text = "인천 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "suwon") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.suwonImage.image = UIImage(named: imageName)
            self.suwonLabel.text = "수원 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "chuncheon") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.chuncheonImage.image = UIImage(named: imageName)
            self.chuncheonLabel.text = "춘천 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "cheongju") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.cheongjuImage.image = UIImage(named: imageName)
            self.cheongjuLabel.text = "청주 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "daejeon") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.daejeonjuImage.image = UIImage(named: imageName)
            self.daejeonjuLabel.text = "대전 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "andong") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.andongjuImage.image = UIImage(named: imageName)
            self.andongjuLabel.text = "안동 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "daegu") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.daeguImage.image = UIImage(named: imageName)
            self.daeguLabel.text = "대구 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "ulsan") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.ulsanImage.image = UIImage(named: imageName)
            self.ulsanLabel.text = "울산 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "busan") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.pusanImage.image = UIImage(named: imageName)
            self.pusanLabel.text = "부산 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "jeonju") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.jeonjuImage.image = UIImage(named: imageName)
            self.jeonjuLabel.text = "전주 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "gwangju") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.gwangjuImage.image = UIImage(named: imageName)
            self.gwangjuLabel.text = "광주 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "yeosu") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.yeosuImage.image = UIImage(named: imageName)
            self.yeosuLabel.text = "여수 \(pm10)" as String
        }
        
        newAQApi.currentDustByCity(name: "seogwipo") { (results) in
            let aqpm25 = Set_PM25(data: results)
            
            var pm10 = aqpm25.pm10
            let imageName: String = self.pm10imageSelection(setpm10: pm10)
            
            self.jejuImage.image = UIImage(named: imageName)
            self.JejuLabel.text = "제주 \(pm10)" as String
        }
        
    }
    
    
    func pm10imageSelection (setpm10: Int) -> String {
        
        var imageName: String = ""
        
        if setpm10 <= 54 {
            imageName = "AQI_1"
        } else if setpm10 <= 154 {
            imageName = "AQI_2"
        } else if setpm10 <= 254 {
            imageName = "AQI_3"
        } else if setpm10 <= 354 {
            imageName = "AQI_4"
        } else if setpm10 <= 424 {
            imageName = "AQI_5"
        } else {
            imageName = "AQI_6"
        }
        
        return imageName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentDust()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}
