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
        pointingFingerImageView.imageView.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    
    
    func animationPointingFingerImageView() {
        view.layoutIfNeeded()
         
        UIView.animate(withDuration: 1, delay: 1.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut) {
            self.pointingFingerImageView.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.pointingFingerImageView.imageView.transform = CGAffineTransform(rotationAngle: -.pi / 7.5)
            self.view.layoutIfNeeded()
        }
    }
    
    
    
}
