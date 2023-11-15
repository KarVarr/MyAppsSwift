//
//  AddViews + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 02.11.2023.
//

import UIKit


extension MyListViewController {
    override func addViews() {
        view.addSubview(customTableView.table)
        view.addSubview(addButton.button)
        
        view.addSubview(verticalStackViewForLabelAndPointingFingerImageView.stack)
        verticalStackViewForLabelAndPointingFingerImageView.stack.addArrangedSubview(pointingFingerTitle.label)
        verticalStackViewForLabelAndPointingFingerImageView.stack.addArrangedSubview(pointingFingerImageView.imageView)
        
    }
}
