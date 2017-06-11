//
//  dustDetailViewController.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 12..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import UIKit

class dustDetailViewController: UIViewController {
    

    @IBOutlet weak var dustDetail: UITextView!
    
    func dustdetailtext() {
    
        self.dustDetail.text = "미세먼지 분류 기준은 AQI기준으로 좋음, 보통 등으로 분류하였습니다.\n단위는 ㎍/㎥이며 24시간을 기준으로 합니다.\n\n미세먼지\n0-54 : 좋음\n55-154 : 보통\n155-254 : 나쁨\n255-354 : 매우나쁨\n355-424 : 해로움\n425이상 : 위험\n\n초미세먼지\n0.0-12.0 : 좋음\n12.1-35.4 : 보통\n35.5-55.4 : 나쁨\n55.5-150.4 : 매우나쁨\n150.5-250.4 : 위험\n250.5이상 : 위험"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dustdetailtext()
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
