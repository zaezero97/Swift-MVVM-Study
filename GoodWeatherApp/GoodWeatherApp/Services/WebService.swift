//
//  WebService.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation


struct Resoruce<T> {
    let url: URL
    let parse: (Data) -> T?
}


final class WebService {
    func load<T>(resource: Resoruce<T>,  completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
