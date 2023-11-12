//
//  TextFieldsConfigure + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 04.11.2023.
//

import UIKit


extension AddNewTaskViewController: UITextFieldDelegate {
    
    func textFieldConfigure () {
        titleTextField.textField.delegate = self
        titleTextField.textField.placeholder = "Type here some text"
        descriptionTextField.textField.placeholder = "Description"
        
        
        // Bottom border
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: titleTextField.textField.frame.height - 1, width: titleTextField.textField.frame.width, height: 1)
        bottomBorder.backgroundColor = UIColor.systemPink.cgColor
        titleTextField.textField.layer.addSublayer(bottomBorder)
        
        //Border
        
        //font
        titleTextField.textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        //padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titleTextField.textField.frame.height))
        titleTextField.textField.leftView = paddingView
        titleTextField.textField.leftViewMode = .always
        titleTextField.textField.rightView = paddingView
        titleTextField.textField.rightViewMode = .always
        
        titleTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == titleTextField.textField {
            updateButtonLayers()
        }
    }
    
    func updateButtonLayers() {
        if let text = titleTextField.textField.text, !text.isEmpty {
            closeButtonCALayer.view.isHidden = true
            doneButtonCALayer.view.isHidden = false
        } else {
            doneButtonCALayer.view.isHidden = true
            closeButtonCALayer.view.isHidden = false
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}

