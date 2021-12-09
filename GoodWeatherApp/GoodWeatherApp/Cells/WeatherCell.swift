//
//  WeatherCell.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = vm.temperature.formatAsDegree() + "°"
        
    }
}
