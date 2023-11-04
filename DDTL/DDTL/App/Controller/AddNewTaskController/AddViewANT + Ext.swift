//
//  AddViewANT + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    override func addViews() {
        view.addSubview(closeButton.button)
        view.addSubview(titleTextField.textField)
        view.addSubview(descriptionTextField.textField)
        view.addSubview(closeButtonCALayer.view)
    }
}
