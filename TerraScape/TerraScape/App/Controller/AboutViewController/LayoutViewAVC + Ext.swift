//
//  LayoutViewAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func layoutViewSVC() {
        let vStackTitleAndAboutLabels = vStackTitleAndAboutLabels.customStackView
        let vStackButtons = vStackButtons.customStackView
        let aboutImageView = aboutImageView.customImageView
        let rateAppButton = rateAppButton.customButton
        let reportAProblemButton = reportAProblemButton.customButton
        let closeModuleButton = closeModuleButton.customButton
        
        //MARK: - StackViews
        NSLayoutConstraint.activate([
            vStackTitleAndAboutLabels.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            vStackTitleAndAboutLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            vStackTitleAndAboutLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vStackTitleAndAboutLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            vStackButtons.topAnchor.constraint(equalTo: vStackTitleAndAboutLabels.bottomAnchor, constant: 40),
            vStackButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            vStackButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            vStackButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            aboutImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            aboutImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
        
        //MARK: - Buttons
        NSLayoutConstraint.activate([
            reportAProblemButton.heightAnchor.constraint(equalToConstant: 44),
            rateAppButton.heightAnchor.constraint(equalToConstant: 44),
            
            closeModuleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeModuleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeModuleButton.widthAnchor.constraint(equalToConstant: 44),
            closeModuleButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        // Set content hugging priority for buttons
        reportAProblemButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        rateAppButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

