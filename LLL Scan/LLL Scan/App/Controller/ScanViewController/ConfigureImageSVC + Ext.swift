//
//  ConfigureImagePVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

extension ScanVC {
    func configureImageView() {
        miniatureImageHM.imageView.layer.masksToBounds = true
        miniatureImageHM.imageView.layer.shadowOffset = CGSize(width: 3, height: 2)
        miniatureImageHM.imageView.layer.shadowOpacity = 0.3
    }
}
