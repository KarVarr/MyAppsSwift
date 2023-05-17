//
//  CustomCollectionViewCell.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let nameOfSound = CustomLabelView()
    let imageOfSound = CustomImageView()
    let volumeUiView = CustomUIView()
    
    let imageForVolume = CustomImageView()
    
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
//        contentView.addSubview(volumeUiView.customUIView)
        
        volumeUiView.customUIView.addSubview(imageForVolume.customImageView)
    }
    
    func settings() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = Helpers.Colors.deselectWhiteGradient
        gradient.endPoint = CGPoint(x: 0, y: 0.25)
        
        let gradientBorder = CAGradientLayer()
        gradientBorder.frame = CGRect(origin: CGPointZero, size: self.bounds.size)
        gradientBorder.startPoint = CGPointMake(1.0, 0.2)
        gradientBorder.endPoint = CGPointMake(0.0, 0.2)
        gradientBorder.colors = Helpers.Colors.deselectWhiteGradient
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 4
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: Helpers.Radius.cornerRadius, height: Helpers.Radius.cornerRadius))
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.white.cgColor
        gradientBorder.mask = shapeLayer
        
        
        contentView.addSubview(blurEffectView)
        layer.addSublayer(gradientBorder)
        layer.insertSublayer(gradient, at: 0)
        layer.cornerRadius = Helpers.Radius.cornerRadius
        clipsToBounds = true
        
        imageOfSound.customImageView.image = UIImage(named: "bird")
        imageOfSound.customImageView.tintColor = UIColor.white
        
        nameOfSound.customLabel.text = "Forest"
        
        volumeUiView.customUIView.layer.insertSublayer(gradient, at: 0)
        volumeUiView.customUIView.layer.borderWidth = 2
        volumeUiView.customUIView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        volumeUiView.customUIView.layer.cornerRadius = Helpers.Radius.cornerRadius
        volumeUiView.customUIView.clipsToBounds = true
        
        imageForVolume.customImageView.image = UIImage(systemName: "speaker.wave.2")
        imageForVolume.customImageView.tintColor = UIColor.white
    }
    
    
    //MARK: - LAYOUT
    func layout() {
        let image = imageOfSound.customImageView
        let name = nameOfSound.customLabel
        let volume = volumeUiView.customUIView
        let imageForVolume = imageForVolume.customImageView
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
//            volume.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            volume.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//            volume.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            volume.widthAnchor.constraint(equalToConstant: 60),
            
            imageForVolume.bottomAnchor.constraint(equalTo: volume.bottomAnchor, constant: -10),
            imageForVolume.centerXAnchor.constraint(equalTo: volume.centerXAnchor),
            imageForVolume.heightAnchor.constraint(equalToConstant: 30),
            imageForVolume.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}
