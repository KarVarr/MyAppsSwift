//
//  LayoutViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

extension ProductDetailsVC {
    override func layoutView() {
        let productImage = productImage.imageView
        let articleLabel = articleLabel.label
        let titleLabel = titleLabel.label
        let colorLabel = colorLabel.label
        let materialLabel = materialLabel.label
        let descriptionLabel = descriptionLabel.label
        let priceLabel = priceLabel.label
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            productImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            articleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            articleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: articleLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            colorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            materialLabel.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10),
            materialLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: materialLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
