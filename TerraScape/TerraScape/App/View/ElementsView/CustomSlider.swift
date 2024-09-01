//
//  Slider.swift
//  TerraScape
//
//  Created by Karen Vardanian on 29.05.2023.
//

import UIKit

final class Slider: UISlider {
    private let baseLayer = CALayer()
    private let trackLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateTrackLayer()
    }
    
    private func setup() {
        clear()
        createBaseLayer()
        createThumbImageView()
        configureTrackLayer()
        addUserInteractions()
        
        //Arabic localization
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            semanticContentAttribute = .forceRightToLeft
        } else {
            semanticContentAttribute = .forceLeftToRight
        }
    }
    
    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }
    
    private func createBaseLayer() {
        baseLayer.backgroundColor = UIColor.secondarySystemFill.cgColor
        baseLayer.frame = .init(x: 0, y: 0, width: frame.width, height: frame.height )
        baseLayer.cornerRadius = frame.height / 2
        baseLayer.masksToBounds = true
        layer.insertSublayer(baseLayer, at: 0)
    }
    
    private func configureTrackLayer() {
        let firstColor = UIColor(white: 1, alpha: 0.9).cgColor
        let secondColor = UIColor(white: 1, alpha: 0.7).cgColor
        trackLayer.colors = [firstColor, secondColor]
        trackLayer.startPoint = .init(x: 0, y: 0.5)
        trackLayer.endPoint = .init(x: 1, y: 0.5)
        trackLayer.cornerRadius = frame.height / 2
        trackLayer.masksToBounds = true
        
        layer.insertSublayer(trackLayer, at: 1)
    }
    
    private func addUserInteractions() {
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }

    private func updateTrackLayer() {
        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        let adjustedWidth: CGFloat
        let isRTL = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
        
        //Arabic localization
        if isRTL {
            adjustedWidth = bounds.width - thumbRectA.minX
        } else {
            adjustedWidth = thumbRectA.maxX
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        //Arabic localization
        if isRTL {
            trackLayer.frame = .init(x: bounds.width - adjustedWidth, y: 0, width: adjustedWidth, height: frame.height)
        } else {
            trackLayer.frame = .init(x: 0, y: 0, width: adjustedWidth, height: frame.height)
        }
        
        CATransaction.commit()
    }

    
    @objc private func valueChanged(_ sender: Slider) {
        updateTrackLayer()
    }
    
    private func createThumbImageView() {
        let thumbSize = frame.height
        let thumbView = ThumbView(frame: .init(x: 0, y: 0, width: thumbSize, height: thumbSize))
        thumbView.layer.cornerRadius = thumbSize / 2
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

final class ThumbView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        let middleView = UIView(frame: .init(x: frame.midX - 6, y: frame.midY - 6, width: 12, height: 12))
        middleView.backgroundColor = .white
        middleView.layer.cornerRadius = 6
        addSubview(middleView)
    }
}

extension UIView {
    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let capturedImage = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return capturedImage
    }
}
