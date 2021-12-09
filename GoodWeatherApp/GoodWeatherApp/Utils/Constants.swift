//
//  Constants.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation


struct Constants {
    struct Urls {
        static func urlForWeatherBycity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=279bd4920a028d1690eea3ac9394b20d&units=\(unit)")!
        }
    }
}
