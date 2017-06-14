//
//  licenseViewController.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 12..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit

class licenseViewController: UIViewController {
    
    @IBOutlet weak var licenseText: UITextView!

    func writelicenseText() {
        self.licenseText.text = "OpenAPI\n - 날씨 : https://openweathermap.org/ 이용\n - 미세먼지 : http://aqicn.org/\n\n그 외\n - 지도 : 구글맵스\n - 런처화면 폰트 : 나눔고딕"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        writelicenseText()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
