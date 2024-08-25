//
//  AddViewsToolbar + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension ToolbarView {
    func addViewsToolbar() {
        [
            label.customLabel,
            settingButton.customButton,
            playButton.customButton
        ].forEach {addSubview($0)}
    }
}
