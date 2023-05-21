//
//  Slider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit

class UISliderCustom {
    let customSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.isContinuous = false
        slider.minimumTrackTintColor = .white
        
        slider.tintColor = .secondaryLabel
        slider.backgroundColor = .clear
        
        let baseLayer = CALayer()
        baseLayer.borderWidth = 1
        baseLayer.borderColor = UIColor.lightGray.cgColor
        baseLayer.backgroundColor = UIColor.red.cgColor
        baseLayer.frame = CGRect(x: 0, y: 0, width: 40, height: 80)
        slider.layer.insertSublayer(baseLayer, at: 0)
        
        return slider
    }()
}
