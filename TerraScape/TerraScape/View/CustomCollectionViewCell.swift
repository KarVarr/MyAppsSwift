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
    let volumeOfSound = UISliderCustom()
    
    let slider = Slider()
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
        
//        contentView.addSubview(slider)
        contentView.addSubview(sliderView.customUIView)
        sliderView.customUIView.addSubview(volumeOfSound.customSlider)
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
        
        sliderView.customUIView.backgroundColor = .cyan.withAlphaComponent(0.3)
//        sliderView.customUIView.layer.cornerRadius = 20
        slider.transform = CGAffineTransform(rotationAngle: -.pi / 2)
    }
    
    
    //MARK: - LAYOUT
    func layout() {
        let image = imageOfSound.customImageView
        let name = nameOfSound.customLabel
        let volume = volumeOfSound.customSlider
        
        let sliderView = sliderView.customUIView
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            volume.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            volume.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            volume.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            volume.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: -20),
            
            
//            slider.topAnchor.constraint(equalTo: contentView.topAnchor),
//            slider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            slider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//            slider.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: -20),
//            slider.widthAnchor.constraint(equalToConstant: 80),
//            slider.heightAnchor.constraint(equalToConstant: 250),
            
            sliderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            sliderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            sliderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            sliderView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            
        ])
    }
    
}
