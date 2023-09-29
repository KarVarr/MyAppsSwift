//
//  Effects + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit

extension PictureOfDayViewController {
    //MARK: - Blur
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayerForHStack = CAGradientLayer()
        gradientLayerForHStack.frame = view.bounds
        gradientLayerForHStack.colors = Helper.Colors.pinkAndBlueGradient
        gradientLayerForHStack.endPoint = CGPoint(x: 0, y: 0.5)
        
        viewContainerForTitleAndDate.view.addSubview(blurView)
        viewContainerForTitleAndDate.view.layer.insertSublayer(gradientLayerForHStack, at: 0)
    }
    
    //MARK: - Gradient
    func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = Helper.Colors.blueGradient
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        viewForAbout.view.layer.insertSublayer(gradientLayer, at: 0)
        
        let gradientLayerForView = CAGradientLayer()
        gradientLayerForView.frame = view.bounds
        gradientLayerForView.colors = Helper.Colors.darkBlueGradient
        gradientLayerForView.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayerForView.locations = [0.2]
        self.view.layer.insertSublayer(gradientLayerForView, at: 0)
        
    }
    
    
    //MARK: - Making a Stars
    func makeStars() {
        starsView.view.backgroundColor = .clear
        starsView.view.frame = view.bounds
        
        for _ in 0..<60 {
            let star = UIView()
            star.backgroundColor = Helper.Colors.lightYellow
            star.layer.shadowOffset = .zero
            star.layer.shadowColor = Helper.Colors.white.cgColor
            star.layer.shadowRadius = 4
            
            
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 1..<6)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
            
            //Animation
            view.layoutIfNeeded()
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse]) {
                star.backgroundColor = Helper.Colors.yellow
                star.layer.shadowOpacity = 3
                self.view.layoutIfNeeded()
            }
        }
    }
}
