//
//  String.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/08.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
