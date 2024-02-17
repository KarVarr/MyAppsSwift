//
//  Circle + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 15.10.2023.
//

import UIKit


extension MainViewController {
    func createCircle(for circle: ViewBoxView, withColor color: UIColor) {
        circle.viewBox.backgroundColor = .clear
        
        let circleLayer = CALayer()
        circleLayer.bounds = circle.viewBox.bounds
        circleLayer.position = CGPoint(x: circle.viewBox.bounds.midX, y: circle.viewBox.bounds.midY)
        circleLayer.cornerRadius = circle.viewBox.bounds.width / 2
        circleLayer.backgroundColor = color.cgColor
        circleLayer.masksToBounds = true
        
        circle.viewBox.layer.addSublayer(circleLayer)
    }
    
    //MARK: - Dynamic circle ball width for iPad and iPhone
    func dynamicWidth() -> Double {
        var width = 0.0
        if UIDevice.current.userInterfaceIdiom == .phone {
            width = 0.45
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            width = 0.35
        }
        return width
    }

}
