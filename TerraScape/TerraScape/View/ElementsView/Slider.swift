//
//  Slider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit

class Slider {
    let customSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .secondaryLabel
        
        return slider
    }()
}
