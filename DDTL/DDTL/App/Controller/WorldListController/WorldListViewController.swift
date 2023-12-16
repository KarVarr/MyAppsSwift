//
//  WorldListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

class WorldListViewController: BaseViewController {
    var worldListData: [MyListData] = MyListViewController().myListData
    let tableViewWLVC = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("array count in viewDidLoad \(String(describing: worldListData.count))")
        configureTableViewWVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("array count is \(String(describing: worldListData.count))")
        DispatchQueue.main.async {
            self.tableViewWLVC.table.reloadData()
        }
        print("view world will appear and reload")
    }
 
}
