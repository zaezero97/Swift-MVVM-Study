//
//  AddOrderViewController.swift
//  CoffeeOrderApp
//
//  Created by 재영신 on 2021/12/07.
//

import UIKit

protocol AddCoffeeOrderDelegate: AnyObject {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    weak var delegate: AddCoffeeOrderDelegate?
    private var vm = AddCoffeeViewModel()
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    private func setUpUI() {
        
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: vm.size)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(coffeeSizesSegmentedControl)
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor,constant: 20).isActive = true
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @IBAction func save(_ sender: Any) {
        let name = self.nameTextField.text
        let total = Double(self.totalTextField.text!)
        
        let selectedSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!!!")
        }
        
        self.vm.name = name
        self.vm.total = total
        self.vm.selectedSize = selectedSize
        self.vm.selectedCoffeeName = self.vm.coffeeName[indexPath.row]
        
        WebService().load(resource: Order.create(vm: self.vm)) { result in
            switch result {
            case .success(let order):
                
                if let order = order, let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
                print(order)
            case .failure(let error):
                print("error!!! -> ",error)
            }
        }
    }
}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.coffeeName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.coffeeName.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
     
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

