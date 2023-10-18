//
//  Effects + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit

extension PictureOfDayViewController: UIScrollViewDelegate {
    
    //MARK: - Dynamic Font size
    func dynamicFontSize(_ fontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * fontSize
        return calculatedFontSize
    }
    
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
