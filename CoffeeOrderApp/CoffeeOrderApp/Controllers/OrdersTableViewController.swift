//
//  OrdersTableViewController.swift
//  CoffeeOrderApp
//
//  Created by 재영신 on 2021/12/07.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        WebService().load(resource: Order.all) { [weak self] result in
            switch result {
                case .success(let orders) :
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                case .failure(let error) :
                    print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.coffeeName
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addOrderVC = segue.destination as? AddOrderViewController {
            addOrderVC.delegate = self
        } else {
            fatalError("Error prepare")
        }
    }
}
 

extension OrderTableViewController: AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated:true, completion: nil)
        let orderViewModel = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderViewModel)
        self.tableView.insertRows(at: [IndexPath(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        
    }
    
    
}
