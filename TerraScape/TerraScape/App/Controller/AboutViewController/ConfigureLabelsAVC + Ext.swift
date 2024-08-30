//
//  ConfigureLabelsAVC + Ext.swift.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension AboutViewController {
    func configureLabelsSVC() {
        DispatchQueue.main.async {
            [
                self.nameView.customLabel,
                self.aboutTitleLabel.customLabel,
                self.aboutVersionLabels.customLabel,
                self.aboutTextLabel.customLabel
            ].forEach {
                $0.textColor = Helpers.Colors.settingsWhite
                $0.font = Helpers.Fonts.AppleSDGothicNeoRegular(with: 18)
            }
            
            self.nameView.customLabel.text = Helpers.Strings.settingsTitle
            self.nameView.customLabel.textColor = Helpers.Colors.settingsWhite.withAlphaComponent(0.6)
        
            self.aboutTitleLabel.customLabel.font = Helpers.Fonts.GillSansBold(with: 24)
            self.aboutTitleLabel.customLabel.text = Helpers.Strings.settingsAboutTitleLabel
            
            self.aboutVersionLabels.customLabel.text = Helpers.Strings.aboutVersionTitle
            self.aboutVersionLabels.customLabel.font = Helpers.Fonts.AppleSDGothicNeoRegular(with: 12)
            self.aboutVersionLabels.customLabel.textColor = Helpers.Colors.settingsWhite.withAlphaComponent(0.8)
        
            self.aboutTextLabel.customLabel.text = Helpers.Strings.settingsAboutText
            self.aboutTextLabel.customLabel.textAlignment = .center
            self.aboutTextLabel.customLabel.numberOfLines = 0
        }
    }

}
