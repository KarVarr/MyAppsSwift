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
        customTableView.table.backgroundColor = Helper.Colors.lightBlue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.tableViewCellKey, for: indexPath) as! TableViewCell
        
        let myList = myListData[indexPath.row]
        cell.titleLabel.label.text = myList.title
        cell.dateLabel.label.text =  daysSinceCreation(for: MyListData()) + 1 <= 1 ? String("Day One") : String("\(daysSinceCreation(for: MyListData())) days")
        cell.backgroundColor = Helper.Colors.lightBlue
        
        return cell
    }
    
    //MARK: - Delete Row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted row")
            
            self.myListData.remove(at: indexPath.row)
            self.customTableView.table.deleteRows(at: [indexPath], with: .fade)
            
            if myListData.isEmpty {
                verticalStackViewForLabelAndPointingFingerImageView.stack.isHidden = false
            }
        }
        
    }
  
    
    //MARK: - Days Counter
    func daysSinceCreation(for task: MyListData) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        if let creationDate = task.creationDate, let days = calendar.dateComponents([.day], from: creationDate, to: currentDate).day {
            return days
        }
        return 0
    }
    
}
