//
//  SettingViewController.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/09.
//

import Foundation
import UIKit

protocol SettingDelegate: AnyObject {
    func settingDone(vm : SettingViewModel)
}

class SettingViewController: UITableViewController {
    private var settingViewModel = SettingViewModel()
    weak var delegate: SettingDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = settingViewModel.units[indexPath.row]
            settingViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        let settingItem = settingViewModel.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        
        cell.accessoryType = settingItem == settingViewModel.selectedUnit ? .checkmark : .none
        return cell
    }
    
    @IBAction func clickDoneButton(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.settingDone(vm: self.settingViewModel)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
