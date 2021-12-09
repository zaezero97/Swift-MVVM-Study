//
//  WeatherResponse.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}
struct Weather: Decodable {
    let temp: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}
