//
//  LayoutView + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension SettingsViewController {
    func layoutViewSVC() {
        let verticalStackViewForText = verticalStackViewForText.customStackView
        let horizontalStackViewForButtons = horizontalStackViewForButtons.customStackView
        let rateAppButton = rateAppButton.customButton
        let reportAProblemButton = reportAProblemButton.customButton
        let closeModuleButton = closeModuleButton.customButton
        
        NSLayoutConstraint.activate([
            verticalStackViewForText.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            verticalStackViewForText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackViewForText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackViewForText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            horizontalStackViewForButtons.topAnchor.constraint(equalTo: verticalStackViewForText.bottomAnchor, constant: 40),
            horizontalStackViewForButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackViewForButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //            reportAProblemButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            reportAProblemButton.heightAnchor.constraint(equalToConstant: 44),
            
            
            //            rateAppButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
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

