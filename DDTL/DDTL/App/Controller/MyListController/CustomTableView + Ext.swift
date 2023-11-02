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
        customTableView.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        customTableView.table.frame = view.bounds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "number - \(indexPath.row)"
        
        return cell
    }
    
    
}
