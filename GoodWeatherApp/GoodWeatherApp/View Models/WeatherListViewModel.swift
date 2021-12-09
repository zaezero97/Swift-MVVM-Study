//
//  WeatherListViewModel.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModelList = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModelList.append(vm)
    }
    
    func numberOfRow(_ section: Int) -> Int {
        return weatherViewModelList.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModelList[index]
    }
        
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelsius() {
        self.weatherViewModelList = self.weatherViewModelList.map { weatherVM in
            weatherVM.temperature.currentTemperature = (weatherVM.temperature.currentTemperature - 32) * 5/9
            weatherVM.temperature.temperatureMax = (weatherVM.temperature.temperatureMax - 32) * 5/9
            weatherVM.temperature.temperatureMin = (weatherVM.temperature.temperatureMin - 32) * 5/9
            return weatherVM
        }
    }
    
    private func toFahrenheit() {
        self.weatherViewModelList = self.weatherViewModelList.map { weatherVM in
            weatherVM.temperature.currentTemperature = (weatherVM.temperature.currentTemperature * 9/5) + 32
            weatherVM.temperature.temperatureMax = (weatherVM.temperature.temperatureMax * 9/5) + 32
            weatherVM.temperature.temperatureMin = (weatherVM.temperature.temperatureMin * 9/5) + 32
            return weatherVM
        }
    }
}
