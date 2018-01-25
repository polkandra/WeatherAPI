//
//  CurrentWeather.swift
//  WeatherAPI
//
//  Created by Mikhail Kozlyukov on 25.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    
    var _currentDate: String!
    var _cityName: String!
    var _currentTemp: Double!
    var _weatherType: String!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType;
        
    }
    
    
    
    var currentDate: String {
        if _currentDate == nil {
            _currentDate = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._currentDate = "Today, \(currentDate)"
        return _currentDate
        
    }
    
    func downloadWeatherDetails (completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL2).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary <String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let main = dict["main"] as? Dictionary <String, AnyObject> {
                    if let currentTmp = main["temp"] as? Double {
                        let kelvinToCelsius = round(currentTmp - 273)
                        self._currentTemp = kelvinToCelsius
                        print(self._currentTemp )
                    }
                }
                if let weather = dict["weather"] as? [Dictionary <String, AnyObject>] {
                    if let type = weather[0]["main"] as? String {
                        self._weatherType = type.capitalized
                        print(self._weatherType )
                    }
                    
                }
                
            }
            completed()
        }
    }
    
}
