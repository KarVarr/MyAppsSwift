//
//  CustomCollectionViewCell.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        settings()
        layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews() {
        
    }
    
    func settings() {
        let gradient = CAGradientLayer()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        
        gradient.frame = bounds
//        gradient.colors = [UIColor.black.cgColor, UIColor.red.cgColor]
        gradient.colors = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.4).cgColor]
        gradient.endPoint = CGPoint(x: 0, y: 0.25)
        
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.addSubview(blurEffectView)
        
        layer.insertSublayer(gradient, at: 0)
        layer.cornerRadius = 30
        clipsToBounds = true
    }
    
    func layout() {
        
    }
}
