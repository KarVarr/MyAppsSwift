//
//  EffectsHD + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit


extension HDPictureViewController {
    //MARK: - Gradient
    func addGradientLayer() {
        let gradientLayerForView = CAGradientLayer()
        gradientLayerForView.frame = view.bounds
        gradientLayerForView.colors = Helper.Colors.darkBlueGradient
        gradientLayerForView.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayerForView.locations = [0.2]
        self.view.layer.insertSublayer(gradientLayerForView, at: 0)
    }
}
