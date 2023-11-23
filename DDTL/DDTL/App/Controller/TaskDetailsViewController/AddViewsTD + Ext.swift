//
//  AddViewsTD + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 23.11.2023.
//

import Foundation


extension TaskDetailsViewController {
    override func addViews() {
        view.addSubview(navigationTitle.label)
        view.addSubview(customViewForTitleAndDescription.view)
        view.addSubview(customViewForDateAndLikes.view)
    }
}
