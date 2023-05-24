//
//  Animations.swift
//  TerraScape
//
//  Created by Karen Vardanian on 24.05.2023.
//

import UIKit

class Animations {
     
    func animateBalls(for ball: UIView, in view: UIView, to distance: CGFloat, path clockwise: Bool, time duration: CFTimeInterval) {
        let centerX = view.bounds.width / 2
        let centerY = view.bounds.height / 2
        let radius = min(centerX, centerY) - 200
        
        let smallBallPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius - distance, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: clockwise)
        let smallBallAnimation = CAKeyframeAnimation(keyPath: "position")
        smallBallAnimation.path = smallBallPath.cgPath
        smallBallAnimation.duration = duration
        smallBallAnimation.repeatCount = .infinity
        smallBallAnimation.calculationMode = .paced
        ball.layer.add(smallBallAnimation, forKey: "animation")
        
    }
    
    func createGradientLayerForCircle(for circle: UIView, in view: UIView, of radius: CGFloat, with color: [Any], start sPoint: CGPoint, end ePoint: CGPoint) {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = color
        layer.startPoint = sPoint
        layer.endPoint = ePoint
        circle.layer.insertSublayer(layer, at: 0)
        circle.layer.cornerRadius = radius
        circle.clipsToBounds = true
    }
}
