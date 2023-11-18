//
//  ConfigureLabel + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit

extension MyListViewController {
    func configureLabel() {
        pointingFingerTitle.label.text = "ADD NEW TASK"
        pointingFingerTitle.label.font = Helper.Fonts.ChalkboardSERegular(with: 28)
        pointingFingerTitle.label.textColor = Helper.Colors.darkBlue
        
        pointingFingerTitle.label.layer.shadowColor = Helper.Colors.redOrange.cgColor
        pointingFingerTitle.label.layer.shadowRadius = 1
        pointingFingerTitle.label.layer.shadowOpacity = 5
        pointingFingerTitle.label.layer.shadowOffset = CGSize(width: 2, height: 2)
        pointingFingerTitle.label.layer.masksToBounds = false
        
    }
}
