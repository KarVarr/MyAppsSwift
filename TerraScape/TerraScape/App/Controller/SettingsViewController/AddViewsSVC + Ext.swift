//
//  AddViewsSVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension SettingsViewController {
    func addViewsSVC() {
        view.addSubview(verticalStackViewForText.customStackView)
        verticalStackViewForText.customStackView.addArrangedSubview(titleLabel.customLabel)
        verticalStackViewForText.customStackView.addArrangedSubview(aboutTitleLabel.customLabel)
        verticalStackViewForText.customStackView.addArrangedSubview(aboutTextLabel.customLabel)
        
        view.addSubview(horizontalStackViewForButtons.customStackView)
        horizontalStackViewForButtons.customStackView.addArrangedSubview(rateAppButton.customButton)
        horizontalStackViewForButtons.customStackView.addArrangedSubview(reportAProblemButton.customButton)
        
        view.addSubview(closeModuleButton.customButton)
    }
}
