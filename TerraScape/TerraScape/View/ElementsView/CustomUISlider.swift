//
//  CustomUISlider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit


class CustomUISlider: UISlider {
    
    private let baseLayer = CALayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    private func setup() {
        clear()
        createBaseLayer()
        createThumbImageView()
    }
    
    private func clear() {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
        
        
    }
    
    private func createBaseLayer() {
        baseLayer.borderWidth = 1
        baseLayer.borderColor = UIColor.lightGray.cgColor
        baseLayer.masksToBounds = true
        baseLayer.backgroundColor = UIColor.secondaryLabel.cgColor
        baseLayer.frame = .init(x: -50, y: 0, width: 155, height: 55 )
//        baseLayer.cornerRadius = baseLayer.frame.width / 2
        
        layer.insertSublayer(baseLayer, at: 0)
        transform = CGAffineTransform(rotationAngle: .pi / 2)
    }
    
    private func createThumbImageView() {
//        let thumbSize = (3 * frame.height) / 4
        let thumbView = ThumbView(frame: .init(x: 0, y: 0, width: 5, height: 55))
//        thumbView.layer.cornerRadius = thumbSize / 2
        
        thumbView.transform = CGAffineTransform(rotationAngle: 30)

        
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
        
    }
}

