//
//  Double.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/09.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f", self)
    }
}
