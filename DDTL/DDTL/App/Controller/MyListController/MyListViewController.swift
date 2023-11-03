//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

class MyListViewController: BaseViewController {
    let customTableView = CustomTableView()
    
    let addButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTableView()
        addButtonConfigure()
    }
    
   
}





