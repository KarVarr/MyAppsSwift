//
//  AddButtonConfigure + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension MyListViewController {
    func addButtonConfigure() {
        
        addButton.button.backgroundColor = Helper.Colors.lightPink
        addButton.button.setTitleColor(Helper.Colors.darkBlue, for: .normal)
        addButton.button.setTitle("+", for: .normal)
        addButton.button.titleLabel?.font = UIFont.systemFont(ofSize: 52, weight: .light)
        addButton.button.layer.cornerRadius = 33
        
        addButton.button.layer.shadowRadius = 7
        addButton.button.layer.shadowOffset = CGSize(width: 2, height: 2)
        addButton.button.layer.shadowOpacity = 5
        addButton.button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        
        addButton.button.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
    }
    
    @objc func addNewTask() {
        let addNewTaskViewController = AddNewTaskViewController()
        addNewTaskViewController.delegate = self
        present(addNewTaskViewController, animated: true)
    }
}

