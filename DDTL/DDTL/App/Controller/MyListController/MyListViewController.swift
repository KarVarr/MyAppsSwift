//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit


protocol DataDelegate: AnyObject {
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?)
}

class MyListViewController: BaseViewController, DataDelegate {
    var myListData: [MyListData] = []
    var isHiddenStackView = false
    
    let customTableView = CustomTableView()
    let verticalStackViewForLabelAndPointingFingerImageView = CustomStackView()
    
    let pointingFingerTitle = CustomLabelView()
    let pointingFingerImageView = CustomImageView()
    let addButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableView()
        configureStackView()
        configureLabel()
        configurePointingFingerImageView()
        addButtonConfigure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customTableView.table.reloadData()
        print("table is reloaded")
    }
    
    
    
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?) {
        let newTask = MyListData(title: title, description: description, date: creationDate)
        myListData.append(newTask)
        
        if !myListData.isEmpty {
            verticalStackViewForLabelAndPointingFingerImageView.stack.isHidden = true
        } else {
            verticalStackViewForLabelAndPointingFingerImageView.stack.isHidden = false
        }
        
        customTableView.table.reloadData()
    }
    
    
}





