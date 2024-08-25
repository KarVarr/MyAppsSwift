//
//  ConfigureButtonsSVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension SettingsViewController {
    func configureButtonsSVC() {
         let buttons: [UIButton] = [rateAppButton.customButton, reportAProblemButton.customButton]
         
         for button in buttons {
             button.tintColor = .black
             button.backgroundColor = Helpers.Colors.buttonsForSettingColor
             button.layer.cornerRadius = Helpers.Radius.cornerRadius
             button.layer.shadowColor = UIColor.black.cgColor
             button.layer.shadowRadius = 4
             button.layer.shadowOpacity = 0.1
             button.layer.shadowOffset = CGSize(width: 5, height: 5)
         }
         
         rateAppButton.customButton.setTitle("Rate", for: .normal)
         rateAppButton.customButton.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)
         
         reportAProblemButton.customButton.setTitle("Report", for: .normal)
         reportAProblemButton.customButton.addTarget(self, action: #selector(sendEmailAboutABug), for: .touchUpInside)
         
         DispatchQueue.main.async {
             self.closeModuleButton.customButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
         }
        
         closeModuleButton.customButton.tintColor = Helpers.Colors.settingsWhite.withAlphaComponent(0.6)
         closeModuleButton.customButton.contentVerticalAlignment = .fill
         closeModuleButton.customButton.contentHorizontalAlignment = .fill
         closeModuleButton.customButton.addTarget(self, action: #selector(closeModule), for: .touchUpInside)
     }
}
