//
//  LayoutViewAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func layoutViewSVC() {
        let verticalStackViewForText = verticalStackViewForText.customStackView
        let horizontalStackViewForButtons = horizontalStackViewForButtons.customStackView
        let rateAppButton = rateAppButton.customButton
        let reportAProblemButton = reportAProblemButton.customButton
        let closeModuleButton = closeModuleButton.customButton
        
        //MARK: - StackViews
        NSLayoutConstraint.activate([
            verticalStackViewForText.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            verticalStackViewForText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackViewForText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackViewForText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            horizontalStackViewForButtons.topAnchor.constraint(equalTo: verticalStackViewForText.bottomAnchor, constant: 40),
            horizontalStackViewForButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            horizontalStackViewForButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            horizontalStackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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

