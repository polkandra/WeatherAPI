//
//  Locations.swift
//  WeatherAPI
//
//  Created by Mikhail Kozlyukov on 25.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import CoreLocation


class Locations {
    
    static var sharedInstance = Locations()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
