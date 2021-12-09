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
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind {
                text in
                self.addCityVM.city = text
            }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind{
                text in
                self.addCityVM.state = text
            }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind{
                text in
                self.addCityVM.zipCode = text
            }
        }
    }
    private var addWeatherVM = AddWeatherViewModel()
    weak var delegate: AddWeatherDelegate?
    private var addCityVM = AddCityViewModel()
    
    @IBAction func clickSaveButton(_ sender: Any) {
        print(addCityVM)
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city, completion: {
                weatherVM in
                self.delegate?.addWeatherDidsave(vm: weatherVM)
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
}
