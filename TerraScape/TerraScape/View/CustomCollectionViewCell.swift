//
//  CustomCollectionViewCell.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let nameOfSound = LabelView()
    let imageOfSound = CustomImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        addViews()
        layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews() {
        contentView.addSubview(nameOfSound.customLabel)
        contentView.addSubview(imageOfSound.customImageView)
    }
    
    func settings() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.4).cgColor]
        gradient.endPoint = CGPoint(x: 0, y: 0.25)
        
        let gradientBorder = CAGradientLayer()
        gradientBorder.frame = CGRect(origin: CGPointZero, size: self.bounds.size)
        gradientBorder.startPoint = CGPointMake(1.0, 0.2)
        gradientBorder.endPoint = CGPointMake(0.0, 0.2)
        gradientBorder.colors = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.4).cgColor]
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 8
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 30, height: 30))
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.white.cgColor
        gradientBorder.mask = shapeLayer
        
        
        contentView.addSubview(blurEffectView)
        layer.addSublayer(gradientBorder)
        layer.insertSublayer(gradient, at: 0)
        layer.cornerRadius = 30
        clipsToBounds = true
        
        imageOfSound.customImageView.image = UIImage(named: "bird")
        imageOfSound.customImageView.tintColor = UIColor.white
        
        nameOfSound.customLabel.text = "Forest"
    }
    
    
    //MARK: - LAYOUT
    func layout() {
        let image = imageOfSound.customImageView
        let name = nameOfSound.customLabel
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        ])
    }
}
