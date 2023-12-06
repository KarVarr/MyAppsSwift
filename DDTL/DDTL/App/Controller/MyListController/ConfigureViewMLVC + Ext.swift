//
//  ConfigureViewMLVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 02.11.2023.
//

import UIKit


extension MyListViewController {
    override func configureView() {
        setNavTitle(title: .myListViewController)
    }
    
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?) {
        let newTask = MyListData(title: title, description: description, date: creationDate)
        myListData.append(newTask)
        
        if !myListData.isEmpty {
            imageAndLabelIsHidden(condition: true)
        } else {
            imageAndLabelIsHidden(condition: false)
        }
        
        updateRefreshControlState()
        customTableView.table.reloadData()
    }
    
     func imageAndLabelIsHidden(condition falseOrTrue: Bool) {
        pointingFingerImageView.imageView.isHidden = falseOrTrue
        pointingFingerLabelTop.label.isHidden = falseOrTrue
        pointingFingerLabelMiddle.label.isHidden = falseOrTrue
        pointingFingerLabelBottom.label.isHidden = falseOrTrue
    }
    
    @objc  func updateTable() {
        customTableView.table.reloadData()
        print("Timer !!! 10 sec refresh table")
    }
    
    //MARK: - Refresh Control
    func updateRefreshControlState() {
        if myListData.isEmpty {
            customTableView.table.refreshControl = nil
        } else {
            customTableView.table.refreshControl = refreshControl.refresh
        }
    }
    
    
    
}
