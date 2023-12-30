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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldListData.arrayOfListDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.worldListVCTableViewCell, for: indexPath) as! WorldListVCTableViewCell
        let worldTask = worldListData.arrayOfListDataModel[indexPath.row]
        
        cell.backgroundColor = Helper.Colors.mainColorFromIcon
        cell.indexPath = indexPath
        cell.titleLabel.label.text = worldTask.title
        
        let minutesSinceCreation = minutesSinceCreation(for: worldTask)
        let days = minutesSinceCreation
        
        cell.dateLabel.label.text = ("Days under control: \(days + 1)")
        
        if let likes = worldTask.likes {
            cell.likesLabel.label.text = String(likes)
        }
        
        return cell
    }
    
    func minutesSinceCreation(for task: ListDataModel) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        if let creationDate = task.creationDate, let minutes = calendar.dateComponents([.minute], from: creationDate, to: currentDate).minute {
            return minutes
        }
        return 0
    }
}
