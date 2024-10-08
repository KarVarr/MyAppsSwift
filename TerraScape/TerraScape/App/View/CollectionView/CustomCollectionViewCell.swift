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
    let volumeOfSound = Slider()
    
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
        super.prepareForReuse()
        imageOfSound.customImageView.image = nil
        volumeOfSound.value = 0.0
        nameOfSound.customLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: Helpers.Radius.cellCornerRadius, height: Helpers.Radius.cellCornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
        clipsToBounds = true
        backgroundColor = .clear
    }
    
    func addViews() {
        contentView.addSubview(volumeOfSound)
        contentView.addSubview(nameOfSound.customLabel)
        contentView.addSubview(imageOfSound.customImageView)
        
        contentView.addSubview(sliderView.customUIView)
        sliderView.customUIView.addSubview(volumeOfSound)
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
        
        nameOfSound.customLabel.font = Helpers.Fonts.GillSansBold(with: 14)
 
        volumeOfSound.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - LAYOUT
    func layout() {
        let image = imageOfSound.customImageView
        let name = nameOfSound.customLabel
        let volume = volumeOfSound
        let sliderView = sliderView.customUIView
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: 15),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: 15),
            
            sliderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            sliderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            sliderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            volume.topAnchor.constraint(equalTo: sliderView.topAnchor),
            volume.bottomAnchor.constraint(equalTo: sliderView.bottomAnchor),
            volume.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            volume.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
        ])
    }
}
