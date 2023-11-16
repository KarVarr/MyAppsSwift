//
//  ConfigureImageView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit

extension MyListViewController {
    func configurePointingFingerImageView() {
        pointingFingerImageView.imageView.image = UIImage(named: "imageOfFinger")
        pointingFingerImageView.imageView.transform = CGAffineTransform(rotationAngle: -.pi / 7.5)
    }
}
