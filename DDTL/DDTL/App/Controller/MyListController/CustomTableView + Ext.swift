//
//  CustomTableView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 02.11.2023.
//

import UIKit

extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableView() {
        customTableView.table.delegate = self
        customTableView.table.dataSource = self
        customTableView.table.register(TableViewCell.self, forCellReuseIdentifier: Helper.Keys.tableViewCellKey)
        customTableView.table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.tableViewCellKey, for: indexPath) as! TableViewCell
        
        cell.titleLabel.label.text = "Don't bye fast food \(indexPath.row)"
        cell.dateLabel.label.text = "3 days"
        
        
        return cell
    }
    
    
}
