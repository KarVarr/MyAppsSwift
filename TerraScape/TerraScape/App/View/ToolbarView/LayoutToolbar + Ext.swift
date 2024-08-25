//
//  LayoutToolbar + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension ToolbarView {
    func layoutToolbar() {
        let label = label.customLabel
        let playButton = playButton.customButton
        let settingButton = settingButton.customButton
        
        //MARK: - Label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        //MARK: - Play button
        NSLayoutConstraint.activate([
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 60),
            playButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        //MARK: - Setting button
        NSLayoutConstraint.activate([
            settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            settingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingButton.widthAnchor.constraint(equalToConstant: 60),
            settingButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
