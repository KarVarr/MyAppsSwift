//
//  ToolbarLabel.swift
//  TerraScape
//
//  Created by Karen Vardanian on 22.05.2023.
//

import UIKit

class ToolbarLabel {
    let toolbarLabel: CustomLabelView = {
        let label = CustomLabelView()
        label.customLabel.text = Helpers.Strings.navigationTitle
        label.customLabel.textColor = .secondaryLabel
        
        return label
    }()
}
