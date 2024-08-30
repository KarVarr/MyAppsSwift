//
//  ConfigureImageViewAVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 30.08.2024.
//

import UIKit

extension AboutViewController {
    func configureImageView() {
        aboutImageView.customImageView.image = UIImage(named: "AppIcon")
        aboutImageView.customImageView.layer.cornerRadius = 20.0
    }
}
