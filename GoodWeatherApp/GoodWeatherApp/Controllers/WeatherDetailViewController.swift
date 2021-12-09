//
//  WeatherDetailViewController.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/09.
//

import Foundation
import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    var weatherVM: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    func setLabelText() {
        print("test!!! ->",weatherVM?.temperature.currentTemperature , weatherVM?.temperature.temperatureMax)
        guard let weatherVM = weatherVM else { return }
        
        cityNameLabel.text = weatherVM.city
        currentTemperatureLabel.text = weatherVM.temperature.currentTemperature.formatAsDegree()
        maxTempLabel.text = weatherVM.temperature.temperatureMax.formatAsDegree()
        minTempLabel.text = weatherVM.temperature.temperatureMin.formatAsDegree()
        
    }
}
