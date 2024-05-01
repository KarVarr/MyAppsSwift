//
//  ConfigureViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

extension ProductDetailsVC {
    override func configureView() {
        title = "Details"
        view.backgroundColor = .magenta
    }
    
    func configureImages() {
        if let imageURLString = product?.imageURL,
           let decodedImageURLString = imageURLString.removingPercentEncoding,
           let imageURL = URL(string: "https:"+decodedImageURLString) {
            loadImage(from: imageURL)
            
        }   
    }
    
    func configureLabels() {
        articleLabel.label.text = "Артикул: \(String(describing: product?.article))"
        titleLabel.label.text = "Название: \(String(describing: product?.title))"
        colorLabel.label.text = "Цвет: \(String(describing: product?.colorID))"
        materialLabel.label.text = "Состав: \(String(describing: product?.material))"
        descriptionLabel.label.text = "Описание: \(String(describing: product?.description))"
        priceLabel.label.text = "Цена: \(String(describing: product?.price))"
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
