//
//  ConfigureLabels + Ext.swift.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension SettingsViewController {
    func configureLabelsSVC() {
        DispatchQueue.main.async {
            self.titleLabel.customLabel.font = Helpers.Fonts.Thonburi(with: 18)
            self.titleLabel.customLabel.text = Helpers.Strings.settingsTitle
            self.titleLabel.customLabel.textColor = Helpers.Colors.settingsWhite.withAlphaComponent(0.6)
        
            self.aboutTitleLabel.customLabel.font = Helpers.Fonts.GillSansBold(with: 32)
            self.aboutTitleLabel.customLabel.text = Helpers.Strings.settingsAboutTitleLabel
            self.aboutTitleLabel.customLabel.textColor = Helpers.Colors.settingsWhite
        
            self.aboutTextLabel.customLabel.font = Helpers.Fonts.AppleSDGothicNeoRegular(with: 18)
            self.aboutTextLabel.customLabel.text = Helpers.Strings.settingsAboutText
            self.aboutTextLabel.customLabel.textAlignment = .center
            self.aboutTextLabel.customLabel.numberOfLines = 0
            self.aboutTextLabel.customLabel.textColor = Helpers.Colors.settingsWhite
        }
    }

}
