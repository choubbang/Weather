//
//  AirQualityPM25.swift
//  Weather
//
//  Created by kpugame on 2017. 6. 11..
//  Copyright © 2017년 LEESEUL. All rights reserved.
//

import SwiftyJSON

public class Set_PM25 {

    public var pm10: Int
    public var pm25: Int
    public var date: String
    
    public init(data: JSON) {
        self.pm10 = data["data"]["iaqi"]["pm10"]["v"].intValue
        self.pm25 = data["data"]["iaqi"]["pm25"]["v"].intValue
        self.date = data["data"]["time"]["s"].stringValue
    }
}
