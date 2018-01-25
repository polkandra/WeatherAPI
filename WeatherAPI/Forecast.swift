//
//  Forecast.swift
//  WeatherAPI
//
//  Created by Mikhail Kozlyukov on 25.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    
    var date:String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        
        return _highTemp
        
    }
    
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
    init(weatherDict: Dictionary <String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary <String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToCelsius = Int(round(min - 273))
                self._lowTemp = "\(kelvinToCelsius)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelsius = Int(round(max - 273))
                self._highTemp = "\(kelvinToCelsius)"
                
            }
            
            if let weather = weatherDict["weather"] as? [Dictionary <String, AnyObject>] {
                
                if let type = weather[0]["main"] as? String {
                    self._weatherType = type
                }
            }
            
            
            if let date = weatherDict["dt"] as? Double {
                
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                dateFormatter.timeStyle = .none
                dateFormatter.dateFormat = "EEEE"
                self._date = unixConvertedDate.dayOfWeek()
                
            }
            
        
        }
        
        
    }
    
}
    
    extension Date {
        
        func dayOfWeek() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: self)
        }
    }









