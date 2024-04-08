//
//  ConfigureImagePVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

extension ScanVC {
    func configureImageView() {
        miniatureImageHM.imageView.layer.cornerRadius = 10
        miniatureImageHM.imageView.layer.borderWidth = 1
        miniatureImageHM.imageView.layer.masksToBounds = true
        miniatureImageHM.imageView.layer.shadowOffset = CGSize(width: 2, height: 1)
        miniatureImageHM.imageView.layer.shadowOpacity = 0.6
    }
}
