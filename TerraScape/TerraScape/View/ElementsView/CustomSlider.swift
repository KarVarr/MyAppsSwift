//
//  CustomSlider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 22.05.2023.
//

import UIKit


class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var customBounds = super.trackRect(forBounds: bounds)
        let trackHeight: CGFloat = 10.0 // Adjust the track height as desired
        customBounds.size.height = trackHeight
        customBounds.origin.y = (bounds.size.height - trackHeight) / 2.0
        return customBounds
    }
}
