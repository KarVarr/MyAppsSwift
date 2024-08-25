//
//  ConfigureLabelsToolbar + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension ToolbarView {
    func configureLabelsToolbar() {
        label.customLabel.text = Helpers.Strings.navigationTitle
        label.customLabel.textColor = .white.withAlphaComponent(0.15)
    }
}
