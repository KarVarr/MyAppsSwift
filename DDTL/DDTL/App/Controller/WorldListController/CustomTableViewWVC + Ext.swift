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
        tableViewWLVC.table.register(WorldListVCTableViewCell.self, forCellReuseIdentifier: Helper.Keys.worldListVCTableViewCell)
        tableViewWLVC.table.frame = view.bounds
        tableViewWLVC.table.backgroundColor = Helper.Colors.beige
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.worldListVCTableViewCell, for: indexPath) as! WorldListVCTableViewCell
        cell.backgroundColor = Helper.Colors.mainColorFromIcon
        
        let worldTask = worldListData[indexPath.row]
        
        cell.titleLabel.label.text = worldTask.title
        cell.likesLabel.label.text = String(describing: worldTask.likes)
        cell.dateLabel.label.text = String(describing: worldTask.creationDate)
        tableView.reloadData()
        
//        let data = worldListData[indexPath.row] 
//            cell.configureCell(with: data)
//        
        
        return cell
    }
}
