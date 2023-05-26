//
//  CustomUISlider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit

class CustomUISlider {
    let customSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.isContinuous = true
        slider.minimumTrackTintColor = Helpers.Colors.sliderTrackMinimumColor

        slider.tintColor = .clear
        slider.maximumTrackTintColor = .clear


        return slider
    }()


}

//class UISliderCustom: UISlider {
//
//    private let trackLayer = CAGradientLayer()
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        setup()
//    }
//
//    private func setup() {
//        clear()
//        configureTrackLayer()
//
//        addUserInteractions()
//    }
//
//    private func clear () {
//        translatesAutoresizingMaskIntoConstraints = false
//        minimumValue = 0.0
//        maximumValue = 1.0
//        isContinuous = false
//        tintColor = .clear
//        maximumTrackTintColor = .clear
//        backgroundColor = .clear
//    }
//
//    private func configureTrackLayer() {
//        let firstColor = UIColor(white: 1, alpha: 0.9).cgColor
//        let secondColor = UIColor(white: 1, alpha: 0.6).cgColor
//        trackLayer.colors = [firstColor, secondColor]
//        trackLayer.startPoint = .init(x: 0, y: 0.5)
//        trackLayer.endPoint = .init(x: 1, y: 0.5)
//        trackLayer.frame = .init(x: 0, y: 0, width: 0, height: frame.height )
//        trackLayer.cornerRadius = trackLayer.frame.height / 2
//        layer.insertSublayer(trackLayer, at: 1)
//    }
//
//    private func addUserInteractions() {
//        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
//    }
//
//    @objc func valueChanged(_ sender: UISliderCustom) {
//
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//
//        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
//        trackLayer.frame = .init(x: 0, y: 0, width: thumbRectA.midX, height: frame.height )
//
//        CATransaction.commit()
//    }
//
//}
