//
//  AddWeatherCityViewController.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation
import UIKit

protocol AddWeatherDelegate: AnyObject {
    func addWeatherDidsave(vm: WeatherViewModel)
}
class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    weak var delegate: AddWeatherDelegate?
    
    @IBAction func clickSaveButton(_ sender: Any) {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city, completion: {
                weatherVM in
                self.delegate?.addWeatherDidsave(vm: weatherVM)
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
}
