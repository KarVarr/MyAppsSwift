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
    
    
    func createCircles(in viewController: MainViewController) {
        animateCircles(in: viewController)
        
        self.createGradientLayerForCircle(for: viewController.smallBall.customUIView, in: viewController.view, of: 37.5, with: Helpers.Colors.smallBallGradient, start: CGPoint(x: 0.1, y: 0.5), end: CGPoint(x: 0.5, y: 0.5))
        
        self.createGradientLayerForCircle(for: viewController.mediumBall.customUIView, in: viewController.view, of: 50, with: Helpers.Colors.mediumBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        
        self.createGradientLayerForCircle(for: viewController.bigBall.customUIView, in: viewController.view, of: 75, with: Helpers.Colors.bigBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        
        self.createGradientLayerForCircle(for: viewController.largeBall.customUIView, in: viewController.view, of: 100, with: Helpers.Colors.largeBallGradient, start: CGPoint(x: 0.1, y: 0.5), end: CGPoint(x: 0.5, y: 0.5))
    }
    
    func animateCircles(in viewController: MainViewController) {
        self.animateBalls(for: viewController.smallBall.customUIView, in: viewController.view, to: 180, path: true, time: 11)
        self.animateBalls(for: viewController.mediumBall.customUIView, in: viewController.view, to: 150, path: false, time: 15)
        self.animateBalls(for: viewController.bigBall.customUIView, in: viewController.view, to: 210, path: false, time: 13)
        self.animateBalls(for: viewController.largeBall.customUIView, in: viewController.view, to: 270, path: true, time: 30)
    }
    
    
}
