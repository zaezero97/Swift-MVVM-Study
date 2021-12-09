//
//  AddViewModel.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

struct AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherBycity(city: city)
        let weatherResource = Resoruce<WeatherResponse>(url: weatherURL, parse: {
            data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        })
        
        WebService().load(resource: weatherResource) { result in
            if let weatherResponse = result {
                let vm = WeatherViewModel(weather: weatherResponse)
                completion(vm)
            }
        }
    }
}
