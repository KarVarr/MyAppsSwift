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
    
    override func prepareForReuse() {
        imageOfSound.customImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: Helpers.Radius.cornerRadius, height: Helpers.Radius.cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
        clipsToBounds = true
        backgroundColor = .clear
        
        imageOfSound.customImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
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
        
        contentView.addSubview(blurEffectView)
        layer.insertSublayer(gradient, at: 0)
        
        sliderView.customUIView.layer.cornerRadius = 15
        sliderView.customUIView.clipsToBounds = true
        sliderView.customUIView.backgroundColor = UIColor(white: 1, alpha: 0.5)
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
            
//            image.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            sliderView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            sliderView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sliderView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            sliderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//            sliderView.heightAnchor.constraint(equalToConstant: 30),
            
            volume.topAnchor.constraint(equalTo: sliderView.topAnchor),
            volume.bottomAnchor.constraint(equalTo: sliderView.bottomAnchor),
            volume.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            volume.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
        ])
    }
}
