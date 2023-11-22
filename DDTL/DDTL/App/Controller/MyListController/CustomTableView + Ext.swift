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
        customTableView.table.backgroundColor = Helper.Colors.mainColorFromIcon
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myListData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let taskDetailsVC = TaskDetailsViewController()
        present(taskDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.tableViewCellKey, for: indexPath) as! TableViewCell
        cell.backgroundColor = Helper.Colors.beige
        
        let myList = myListData[indexPath.row]
        
        let minutesSinceCreation = minutesSinceCreation(for: myList)
        let days = minutesSinceCreation   // Convert minutes to days
        cell.dateLabel.label.text = days == 0 ? String("DAY ONE") : String("\(days + 1) DAYS")
        print(days)
        print(minutesSinceCreation)
        
        cell.titleLabel.label.text = myList.title
//        cell.dateLabel.label.text =  daysSinceCreation(for: myList) + 1 <= 1 ? String("Day One") : String("\(daysSinceCreation(for: myList)) days")
        
        return cell
    }
    
    //MARK: - Delete Row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted row")
            
            self.myListData.remove(at: indexPath.row)
            self.customTableView.table.deleteRows(at: [indexPath], with: .fade)
            
            if myListData.isEmpty {
                pointingFingerImageView.imageView.isHidden = false
                pointingFingerLabelTop.label.isHidden = false
                pointingFingerLabelMiddle.label.isHidden = false
                pointingFingerLabelBottom.label.isHidden = false
            }
            
            colorChangeForAddButton()
            updateRefreshControlState()
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
    
    //MARK: - Days Counter
    func minutesSinceCreation(for task: MyListData) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        if let creationDate = task.creationDate, let minutes = calendar.dateComponents([.minute], from: creationDate, to: currentDate).minute {
            return minutes
        }
        return 0
    }
    
}
