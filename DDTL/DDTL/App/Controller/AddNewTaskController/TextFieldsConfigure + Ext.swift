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
        
        //border
        titleTextField.textField.layer.borderWidth = 1.0
        titleTextField.textField.layer.cornerRadius = 22
        titleTextField.textField.layer.borderColor = UIColor.systemPink.cgColor
        
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
            view.layoutIfNeeded()
            UIView.animate(withDuration: 0.7) {
                if let text = textField.text, !text.isEmpty {
                    self.closeButton.button.setImage(UIImage(named: "doneButton"), for: .normal)
                    self.closeButton.button.tintColor = .green
                } else {
                    self.closeButton.button.setImage(UIImage(named: "closeButton"), for: .normal)
                    self.closeButton.button.tintColor = .systemPink
                }
                self.view.layoutIfNeeded()
            }
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()
        return true
    }
    
}
