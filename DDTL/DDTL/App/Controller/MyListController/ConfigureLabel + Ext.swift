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
        pointingFingerTitle.label.font = UIFont.systemFont(ofSize: 28,weight: .bold)
    }
}
