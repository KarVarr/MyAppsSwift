//
//  LayoutViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

extension ProductDetailsVC {
    override func layoutView() {
        let scrollView = scrollViewCustom.scrollViewCustom
        let contentView = contentViewCustom.vc
        let productImage = productImage.imageView
//        let articleLabel = articleLabel.label
//        let titleLabel = titleLabel.label
//        let colorLabel = colorLabel.label
//        let materialLabel = materialLabel.label
//        let descriptionLabel = descriptionLabel.label
//        let priceLabel = priceLabel.label
        let customTableViewProductDetailsVC = customTableViewProductDetailsVC.table
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            productImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            
            customTableViewProductDetailsVC.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            customTableViewProductDetailsVC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customTableViewProductDetailsVC.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customTableViewProductDetailsVC.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            articleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
//            articleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            titleLabel.topAnchor.constraint(equalTo: articleLabel.bottomAnchor, constant: 10),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            colorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
//            colorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            materialLabel.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10),
//            materialLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            descriptionLabel.topAnchor.constraint(equalTo: materialLabel.bottomAnchor, constant: 10),
//            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            
//            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
//            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
