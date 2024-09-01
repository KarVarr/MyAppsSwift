//
//  AddViewsAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func addViewsSVC() {
        view.addSubview(scrollView.customScrollView)
        scrollView.customScrollView.addSubview(vStackTitleAndAboutLabels.customStackView)
        scrollView.customScrollView.addSubview(vStackImageAndTitle.customStackView)
        scrollView.customScrollView.addSubview(vStackButtons.customStackView)
        scrollView.customScrollView.addSubview(closeModuleButton.customButton)
        
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(nameView.customLabel)
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(vStackImageAndTitle.customStackView)
        vStackTitleAndAboutLabels.customStackView.addArrangedSubview(aboutTextLabel.customLabel)
        
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutImageView.customImageView)
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutTitleLabel.customLabel)
        vStackImageAndTitle.customStackView.addArrangedSubview(aboutVersionLabels.customLabel)
        
        vStackButtons.customStackView.addArrangedSubview(rateAppButton.customButton)
        vStackButtons.customStackView.addArrangedSubview(reportAProblemButton.customButton)
    }
}
