//
//  WeatherViewModel.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: TemperatureViewModel
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = TemperatureViewModel(cur_temp: weather.main.temp, max_temp: weather.main.temp_max, min_temp: weather.main.temp_min)
    }
    
    var city: String {
        return weather.name
    }
    
}


class TemperatureViewModel {
    var currentTemperature: Double
    var temperatureMax: Double
    var temperatureMin: Double
    
    init(cur_temp: Double, max_temp:Double, min_temp: Double) {
        self.currentTemperature = cur_temp
        self.temperatureMax = max_temp
        self.temperatureMin = min_temp
    }
}
