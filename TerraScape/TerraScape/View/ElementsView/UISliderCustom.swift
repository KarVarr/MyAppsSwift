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
        
        let trackLayer = CAGradientLayer()
        let firstColor = UIColor(red: 210/255, green: 152/255, blue: 238/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 166/255, green: 20/255, blue: 217/255, alpha: 1).cgColor
        trackLayer.colors = [firstColor, secondColor]
        trackLayer.startPoint = .init(x: 0, y: 0.5)
        trackLayer.endPoint = .init(x: 1, y: 0.5)
        trackLayer.frame = .init(x: 0, y: slider.frame.height / 4, width: 0, height: slider.frame.height / 2)
        trackLayer.cornerRadius = trackLayer.frame.height / 2
        slider.layer.insertSublayer(trackLayer, at: 1)
        
        //        CATransaction.begin()
        //        CATransaction.setDisableActions(true)
        //        let thumbRectA = slider.thumbRect(forBounds: slider.bounds, trackRect: slider.trackRect(forBounds: slider.bounds), value: slider.value)
        //        trackLayer.frame = .init(x: 0, y: slider.frame.height / 4, width: thumbRectA.midX, height: slider.frame.height / 2)
        //
        //        CATransaction.commit()
        
        return slider
    }()
}
