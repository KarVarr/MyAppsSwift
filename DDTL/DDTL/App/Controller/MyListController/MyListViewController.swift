//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

class MyListViewController: BaseViewController {
    let customTableView = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        setNavTitle(title: .myListViewController)
       
        
        configureCustomTableView()
        addViews()
    }

    

}





