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
        
    }
}
