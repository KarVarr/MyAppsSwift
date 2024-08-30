//
//  ConfigureButtonsSVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func configureButtonsSVC() {
        let buttons: [UIButton] = [rateAppButton.customButton, reportAProblemButton.customButton]
        
        for button in buttons {
            var config = UIButton.Configuration.plain()
            config.imagePadding = 15
            button.configuration = config
            button.tintColor = .white
            button.backgroundColor = Helpers.Colors.toolbarSettingsButtonColor
            button.layer.cornerRadius = Helpers.Radius.buttonCornerRadius
            button.contentHorizontalAlignment = .left
        }
        
        rateAppButton.customButton.setTitle("Rate", for: .normal)
        rateAppButton.customButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        rateAppButton.customButton.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)
        
        reportAProblemButton.customButton.setTitle("Report", for: .normal)
        reportAProblemButton.customButton.setImage(UIImage(systemName: "ladybug.fill"), for: .normal)
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
