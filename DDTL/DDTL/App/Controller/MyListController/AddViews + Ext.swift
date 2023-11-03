//
//  AddViews + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 02.11.2023.
//

import UIKit


extension MyListViewController {
    func addViews() {
        view.addSubview(customTableView.table)
        view.addSubview(addButton.button)
    }
}
