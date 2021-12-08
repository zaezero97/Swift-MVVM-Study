//
//  OrderViewModel.swift
//  CoffeeOrderApp
//
//  Created by 재영신 on 2021/12/07.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
    
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
    
    var total: Double {
        return self.order.total
    }
}
