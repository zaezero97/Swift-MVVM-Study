//
//  BindingTextField.swift
//  GoodWeatherApp
//
//  Created by 재영신 on 2021/12/09.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    private var textChangeClosure: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func bind(callback: @escaping (String) -> Void) {
        self.textChangeClosure = callback
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    
    @objc func textFieldChange(textField: UITextField) {
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
}
