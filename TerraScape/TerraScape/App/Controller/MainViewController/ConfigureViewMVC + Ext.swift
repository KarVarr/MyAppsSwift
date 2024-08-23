//
//  ConfigureViewMVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 23.08.2024.
//

import UIKit

extension MainViewController {
    func configureViewMVC() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = Helpers.Colors.mainViewGradient
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
        configureToolbarMVC()
    }
}
