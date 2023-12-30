//
//  AddButtonConfigureMLVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension MyListViewController {
    func addButtonConfigure() {
       
        addButton.button.setImage(UIImage(named: "addSquareFull")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addButton.button.tintColor = Helper.Colors.pink
        addButton.button.layer.cornerRadius = 33
        
        addButton.button.layer.shadowRadius = 3
        addButton.button.layer.shadowOffset = CGSize(width: 2, height: 2)
        addButton.button.layer.shadowOpacity = 3
        addButton.button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        addButton.button.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
    }
    
    @objc func addNewTask() {
        let addNewTaskViewController = AddNewTaskViewController()
        addNewTaskViewController.delegate = self
        present(addNewTaskViewController, animated: true)
    }
    
    func colorChangeForAddButton() {
        addButton.button.tintColor = myListData.arrayOfListDataModel.count > 5 ? Helper.Colors.pink.withAlphaComponent(0.5) :  Helper.Colors.pink
        print("Before button configuration: \(myListData.arrayOfListDataModel.count)")
    }
}

