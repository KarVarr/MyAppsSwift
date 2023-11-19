//
//  ConfigureViewANT + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 19.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    override func configureView() {
        view.backgroundColor = Helper.Colors.palePink
        navTitle.label.text = Helper.Strings.AddNewTaskVC.title
        navTitle.label.textColor = Helper.Colors.darkBlue
        navTitle.label.font = Helper.Fonts.BungeeShadeRegular(with: 24)
    }
}
