//
//  ViewController_TT_D.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 7..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController_TT_D: UIViewController {
    
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var AirQLabel: UILabel!
    
    var arrRes = [[String:AnyObject]]()
    
    func refresh() {
        
        //let dict = arrRes[IndexPath.Index]
        
        //AirQLabel.text = "\(v)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        super.viewDidLoad()
        Alamofire.request("https://api.waqi.info/feed/seoul/?token=11cd99c3c5fc77376913b244e05ac49f0a8a9c45").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["iaqi"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
            }
        }
        
        refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

