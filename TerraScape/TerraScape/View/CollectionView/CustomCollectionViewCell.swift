//
//  CustomCollectionViewCell.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let audioPlayer = AudioPlayerForSound()
    
    let nameOfSound = CustomLabelView()
    let imageOfSound = CustomImageView()
    let volumeOfSound = CustomUISlider()
    
    let sliderView = CustomUIView()
    
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
        contentView.addSubview(volumeOfSound.customSlider)
        contentView.addSubview(nameOfSound.customLabel)
        contentView.addSubview(imageOfSound.customImageView)
        
        contentView.addSubview(sliderView.customUIView)
        sliderView.customUIView.addSubview(volumeOfSound.customSlider)
        
        let customTrackLayer = CALayer()
        customTrackLayer.backgroundColor = UIColor.red.cgColor
        volumeOfSound.customSlider.layer.addSublayer(customTrackLayer)
        
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
        backgroundColor = .clear
        
        sliderView.customUIView.layer.cornerRadius = 15
        sliderView.customUIView.backgroundColor = .white.withAlphaComponent(0.5)
    }
    
    
    //MARK: - LAYOUT
    func layout() {
        let image = imageOfSound.customImageView
        let name = nameOfSound.customLabel
        let volume = volumeOfSound.customSlider
        
        let sliderView = sliderView.customUIView
        
        NSLayoutConstraint.activate([
            
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            image.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),

            sliderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            sliderView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sliderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            sliderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            sliderView.heightAnchor.constraint(equalToConstant: 30),

            volume.topAnchor.constraint(equalTo: sliderView.topAnchor),
            volume.bottomAnchor.constraint(equalTo: sliderView.bottomAnchor),
            volume.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            volume.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
            
        ])
    }
    
    
    
}
