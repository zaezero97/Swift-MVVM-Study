//
//  WeatherViewModel.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
    
    
}
