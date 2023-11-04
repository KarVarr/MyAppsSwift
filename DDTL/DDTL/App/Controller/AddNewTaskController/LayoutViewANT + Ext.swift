//
//  LayoutView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    
    override func layoutView() {
        let closeButton = closeButton.button
        let titleTextField = titleTextField.textField
//        let descriptionTextField = descriptionTextField.textField
//        let crossCheckView = closeButtonCALayer.view
        
        //MARK: - Add Button
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        //MARK: - Title TextField
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),
            titleTextField.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        //MARK: - Cross Check View
//        NSLayoutConstraint.activate([
//            crossCheckView.widthAnchor.constraint(equalToConstant: 100),
//            crossCheckView.heightAnchor.constraint(equalToConstant: 100),
//            crossCheckView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            crossCheckView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
//        ])
    }
}
