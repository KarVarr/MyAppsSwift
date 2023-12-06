//
//  CustomTableViewWVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 06.12.2023.
//

import UIKit

extension WorldListViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableViewWVC() {
        tableViewWLVC.table.delegate = self
        tableViewWLVC.table.dataSource = self
        tableViewWLVC.table.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
