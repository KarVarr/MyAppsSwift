//
//  AddViewsAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func addViewsSVC() {
        view.addSubview(vStackTitleAndAboutLabels.customStackView)
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(nameView.customLabel)
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(vStackImageAndTitle.customStackView)
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(aboutTextLabel.customLabel)
        
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutImageView.customImageView)
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutTitleLabel.customLabel)
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutVersionLabels.customLabel)
        
        view.addSubview(vStackButtons.customStackView)
        vStackButtons.customStackView.addArrangedSubview(rateAppButton.customButton)
        vStackButtons.customStackView.addArrangedSubview(reportAProblemButton.customButton)
        
        view.addSubview(closeModuleButton.customButton)
    }
}
