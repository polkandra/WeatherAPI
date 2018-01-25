//
//  ForecastCell.swift
//  WeatherAPI
//
//  Created by Mikhail Kozlyukov on 25.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit



class ForecastCell: UITableViewCell {
    
    
    @IBOutlet weak var forecastImage: UIImageView!
    @IBOutlet weak var forecastDayLabel: UILabel!
    @IBOutlet weak var forecastTypeLabel: UILabel!
    @IBOutlet weak var forecastMinLabel: UILabel!
    @IBOutlet weak var forecastMaxLabel: UILabel!


    func configureCell (forecast: Forecast) {
        forecastDayLabel.text = forecast.date
        forecastTypeLabel.text = forecast.weatherType
        forecastMinLabel.text = forecast.lowTemp
        forecastMaxLabel.text = forecast.highTemp
        forecastImage.image = UIImage (named: forecast.weatherType)
    }




}
