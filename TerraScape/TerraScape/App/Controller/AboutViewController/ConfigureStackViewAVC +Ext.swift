//
//  ConfigureStackViewAVC +Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func configureStackViewSVC() {
        verticalStackViewForText.customStackView.axis = .vertical
        verticalStackViewForText.customStackView.alignment = .center
        verticalStackViewForText.customStackView.spacing = 20.0
        
        horizontalStackViewForButtons.customStackView.axis = .vertical
        horizontalStackViewForButtons.customStackView.distribution = .fillEqually
        horizontalStackViewForButtons.customStackView.alignment = .fill
        horizontalStackViewForButtons.customStackView.spacing = 10
    }
}
