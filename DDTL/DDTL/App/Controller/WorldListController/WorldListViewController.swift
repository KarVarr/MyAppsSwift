//
//  WorldListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

class WorldListViewController: BaseViewController {
    var worldListData = ArrayOfListDataModel.shared
    let tableViewWLVC = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureTableViewWVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
       
        print("array count is \(String(describing: worldListData.arrayOfListDataModel.count))")
        updateData()
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.tableViewWLVC.table.reloadData()
        }
    }
    

 
}
