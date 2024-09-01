//
//  LayoutViewAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func layoutViewSVC() {
        let scrollView = scrollView.customScrollView
        let vStackTitleAndAboutLabels = vStackTitleAndAboutLabels.customStackView
        let vStackButtons = vStackButtons.customStackView
        let aboutImageView = aboutImageView.customImageView
        let rateAppButton = rateAppButton.customButton
        let reportAProblemButton = reportAProblemButton.customButton
        let closeModuleButton = closeModuleButton.customButton
        
        //MARK: - ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        //MARK: - StackViews
        NSLayoutConstraint.activate([
            vStackTitleAndAboutLabels.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            vStackTitleAndAboutLabels.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            vStackTitleAndAboutLabels.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            vStackTitleAndAboutLabels.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            vStackButtons.topAnchor.constraint(equalTo: vStackTitleAndAboutLabels.bottomAnchor, constant: 40),
            vStackButtons.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            vStackButtons.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            vStackButtons.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            vStackButtons.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        
        //MARK: - Images
        NSLayoutConstraint.activate([
            aboutImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3),
            aboutImageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3),
        ])
        
        //MARK: - Buttons
        NSLayoutConstraint.activate([
            reportAProblemButton.heightAnchor.constraint(equalToConstant: 54),
            rateAppButton.heightAnchor.constraint(equalToConstant: 54),
            
            closeModuleButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            closeModuleButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            closeModuleButton.widthAnchor.constraint(equalToConstant: 44),
            closeModuleButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        // Set content hugging priority for buttons
        reportAProblemButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        rateAppButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

