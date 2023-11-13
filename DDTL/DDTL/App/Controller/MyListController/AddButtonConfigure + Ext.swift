//
//  AddButtonConfigure + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension MyListViewController {
    func addButtonConfigure() {
        
        addButton.button.backgroundColor = Helper.Colors.pink
        addButton.button.setTitleColor(.black, for: .normal)
        addButton.button.setTitle("+", for: .normal)
        addButton.button.titleLabel?.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        addButton.button.layer.cornerRadius = 44
        
        addButton.button.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
    }
    
    @objc func addNewTask() {
        let addNewTaskViewController = AddNewTaskViewController()
        addNewTaskViewController.delegate = self
        present(addNewTaskViewController, animated: true)
    }
}

