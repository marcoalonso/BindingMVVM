//
//  BindingTextField.swift
//  BindingMVVM
//
//  Created by Marco Alonso Rodriguez on 10/01/23.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = { _ in
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        //listen any change on TF
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    //will return the text when this change
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        if let text = textField.text {
            textChanged(text)
        }
    }
}
