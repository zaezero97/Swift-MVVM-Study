//
//  AddCoffeeViewModel.swift
//  CoffeeOrderApp
//
//  Created by 재영신 on 2021/12/07.
//

import Foundation

struct AddCoffeeViewModel {
    var name: String?
    var coffeeName: [String] {
        return CoffeeName.allCases.map { $0.rawValue.capitalized }
    }
    var total: Double?
    var size: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
    
    var selectedSize: String?
    var selectedCoffeeName: String?
}
