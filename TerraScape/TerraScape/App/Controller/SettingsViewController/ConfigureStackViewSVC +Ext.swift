//
//  ConfigureStackViewSVC +Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension SettingsViewController {
    func configureStackViewSVC() {
        verticalStackViewForText.customStackView.axis = .vertical
        verticalStackViewForText.customStackView.alignment = .center
        verticalStackViewForText.customStackView.spacing = 20.0
        
        horizontalStackViewForButtons.customStackView.axis = .horizontal
        horizontalStackViewForButtons.customStackView.distribution = .equalSpacing
        horizontalStackViewForButtons.customStackView.alignment = .center
    }
}
