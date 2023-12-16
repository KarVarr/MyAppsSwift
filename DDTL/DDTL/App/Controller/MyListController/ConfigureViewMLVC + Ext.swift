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
        let newTask = ListDataModel(title: title, description: description, date: creationDate)
        myListData.arrayOfListDataModel.append(newTask)
        
        if !myListData.arrayOfListDataModel.isEmpty {
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
    
    @objc func updateTable() {
        customTableView.table.reloadData()
    }
    
    //MARK: - Refresh Control
    func updateRefreshControlState() {
        if myListData.arrayOfListDataModel.isEmpty {
            customTableView.table.refreshControl = nil
        } else {
            customTableView.table.refreshControl = refreshControl.refresh
        }
    }
}
