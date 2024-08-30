//
//  ConfigureStackViewAVC +Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func configureStackViewSVC() {
        vStackTitleAndAboutLabels.customStackView.axis = .vertical
        vStackTitleAndAboutLabels.customStackView.alignment = .center
        vStackTitleAndAboutLabels.customStackView.spacing = 20.0
        
        vStackImageAndTitle.customStackView.axis = .vertical
        vStackImageAndTitle.customStackView.alignment = .center
        vStackImageAndTitle.customStackView.spacing = 5
        
        vStackButtons.customStackView.axis = .vertical
        vStackButtons.customStackView.distribution = .fillEqually
        vStackButtons.customStackView.alignment = .fill
        vStackButtons.customStackView.spacing = 10
    }
}
