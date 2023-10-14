//
//  Effects + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 14.10.2023.
//

import UIKit

extension MainViewController {
    //MARK: - Blur Effect
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = quoteViewBox.viewBox.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = quoteViewBox.viewBox.bounds
        gradientLayer.colors = Helper.Colors.whiteGradient
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.25)
        
        quoteViewBox.viewBox.addSubview(blurView)
        quoteViewBox.viewBox.layer.insertSublayer(gradientLayer, at: 0)
    }
}
