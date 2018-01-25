//
//  Constants.swift
//  WeatherAPI
//
//  Created by Mikhail Kozlyukov on 25.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "be0ddc29c7cd8c01cfeb7ae5e157769d"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let CURRENT_WEATHER_URL2 = "http://api.openweathermap.org/data/2.5/weather?lat=\(Locations.sharedInstance.latitude!)&lon=\(Locations.sharedInstance.longitude!)&appid=be0ddc29c7cd8c01cfeb7ae5e157769d"


let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Locations.sharedInstance.latitude!)&lon=\(Locations.sharedInstance.longitude!)&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"

typealias DownloadComplete = ()->()




