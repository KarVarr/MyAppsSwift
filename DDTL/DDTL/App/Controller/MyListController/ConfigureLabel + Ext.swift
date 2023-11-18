//
//  ConfigureLabel + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit

extension MyListViewController {
    func configureLabel() {
        pointingFingerTitle.label.text = "Add new task"
        pointingFingerTitle.label.font = UIFont.systemFont(ofSize: 28)
        
        pointingFingerTitle.label.layer.shadowColor = UIColor.red.cgColor
        pointingFingerTitle.label.layer.shadowRadius = 1
        pointingFingerTitle.label.layer.shadowOpacity = 5
        pointingFingerTitle.label.layer.shadowOffset = CGSize(width: 2, height: 2)
        pointingFingerTitle.label.layer.masksToBounds = false
        
    }
}
