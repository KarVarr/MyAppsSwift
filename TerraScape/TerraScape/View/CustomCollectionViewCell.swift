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
