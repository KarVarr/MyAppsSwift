//
//  CustomUISlider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit

final class Slider: UISlider {

    private let baseLayer = CALayer() // Step 3
    private let trackLayer = CAGradientLayer() // Step 7
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }

    private func setup() {
        clear()
        createBaseLayer() // Step 3
        createThumbImageView() // Step 5
        configureTrackLayer() // Step 7
        addUserInteractions() // Step 8
    }

    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }

    // Step 3
    private func createBaseLayer() {

        baseLayer.borderWidth = 1
        baseLayer.borderColor = UIColor.lightGray.cgColor
        baseLayer.masksToBounds = true
        baseLayer.backgroundColor = UIColor.white.cgColor
        baseLayer.frame = .init(x: 0, y: 0, width: frame.size.height, height: frame.size.height / 2 )
        baseLayer.cornerRadius = baseLayer.frame.height / 2
        layer.insertSublayer(baseLayer, at: 0)
    }

    // Step 7
    private func configureTrackLayer() {
//        let firstColor = UIColor(red: 210/255, green: 152/255, blue: 238/255, alpha: 1).cgColor
//        let secondColor = UIColor(red: 166/255, green: 20/255, blue: 217/255, alpha: 1).cgColor
//        trackLayer.colors = [firstColor, secondColor]
//        trackLayer.startPoint = .init(x: 0, y: 0.5)
//        trackLayer.endPoint = .init(x: 1, y: 0.5)
//        trackLayer.frame = .init(x: 0, y: 0, width: frame.size.height, height: frame.size.height / 2)
//        trackLayer.cornerRadius = trackLayer.frame.height / 2
        layer.insertSublayer(trackLayer, at: 1)
    }

    // Step 8
    private func addUserInteractions() {
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }

    @objc private func valueChanged(_ sender: Slider) {
        // Step 10
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        // Step 9
        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        trackLayer.frame = .init(x: 0, y: 0, width: thumbRectA.midX, height: frame.height / 2)
        // Step 10
        CATransaction.commit()
    }

    // Step 5
    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 8
        let thumbView = ThumbView(frame: .init(x: 0, y: 0, width: thumbSize, height: thumbSize))
//        thumbView.layer.cornerRadius = thumbSize / 2
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        // Step 6
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
    }
}
