//
//  ConfigureViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

extension ProductDetailsVC {
    override func configureView() {
        view.backgroundColor = .white
    }
    
    func configureImages() {
        if let imageURLString = product?.imageURL,
           let decodedImageURLString = imageURLString.removingPercentEncoding,
           let imageURL = URL(string: "https:"+decodedImageURLString) {
            loadImage(from: imageURL)
        }
    }
    
    
    private func settingLabelsColor(label: LabelViewCustom, font: UIFont, color: UIColor) {
        label.label.font = font
        label.label.textColor = color
    }
    
    //MARK: - LOAD IMAGE func
    private func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.productImage.imageView.image = image
                }
            }
        }
    }
}

