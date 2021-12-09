//
//  WeatherListTableViewController.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    var weatherListViewModel = WeatherListViewModel()
    var lastUnitSelection: Unit!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let resource = Resoruce<WeatherResponse>(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=279bd4920a028d1690eea3ac9394b20d")!,parse: {
            data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        })
        
        WebService().load(resource: resource, completion: {
            weatherResponse in
            
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        })
        if let value = UserDefaults.standard.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRow(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.configure(self.weatherListViewModel.modelAt(indexPath.row))
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddWeatherVC" {
            let addWeatherVC = segue.destination as! AddWeatherCityViewController
            addWeatherVC.delegate = self
        } else if segue.identifier == "showSettingVC" {
            let settingVC = segue.destination as! SettingViewController
            settingVC.delegate = self
        }
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidsave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
}


extension WeatherListTableViewController: SettingDelegate {
    func settingDone(vm: SettingViewModel) {
        if lastUnitSelection != vm.selectedUnit {
            self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
            self.tableView.reloadData()
            lastUnitSelection = vm.selectedUnit
        }
    }
}
