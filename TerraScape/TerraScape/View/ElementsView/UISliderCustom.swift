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
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.isContinuous = false
        slider.minimumTrackTintColor = .white
        
        slider.tintColor = .clear
        slider.maximumTrackTintColor = .clear
        
        
        return slider
    }()
    
   
}
