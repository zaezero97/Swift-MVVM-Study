//
//  Order.swift
//  CoffeeOrderApp
//
//  Created by 재영신 on 2021/12/07.
//

import Foundation

enum CoffeeName: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let total: Double
    let coffeeName: CoffeeName
    let size: CoffeeSize
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}
extension Order {
    init?(_ vm: AddCoffeeViewModel) {
        guard let name = vm.name,
              let total = vm.total,
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()),
              let selectedCoffeeName = CoffeeName(rawValue: vm.selectedCoffeeName!.lowercased()) else {
                  return nil
              }
        self.name = name
        self.total = total
        self.coffeeName = selectedCoffeeName
        self.size = selectedSize
    }
}

