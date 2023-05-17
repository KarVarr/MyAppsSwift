//
//  ThumbView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 17.05.2023.
//

import UIKit

class ThumbView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 183 / 255, green: 122 / 255, blue: 231 / 255, alpha: 1)
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
