//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit


protocol DataDelegate: AnyObject {
    func didEnterData(title: String, description: String, date: Date?, likes: Int?)
}

class MyListViewController: BaseViewController, DataDelegate {
    var myListData: [MyListData] = []
    
    let customTableView = CustomTableView()

    let addButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTableView()
        addButtonConfigure()

    }
    
    func didEnterData(title: String, description: String, date: Date?, likes: Int?) {
        let newTask = MyListData(title: title, description: description)
        myListData.append(newTask)
        customTableView.table.reloadData()
    }
    
  
}





