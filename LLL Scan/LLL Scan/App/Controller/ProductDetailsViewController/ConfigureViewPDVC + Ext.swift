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
    
 
    
//    func configureLabels() {
//        let labels: [LabelViewCustom] = [
//            articleLabel,
//            titleLabel,
//            colorLabel,
//            materialLabel,
//            descriptionLabel,
//            priceLabel
//        ]
//        
//        for label in labels {
//            settingLabelsColor(label: label, font: UIFont(name: "AppleSDGothicNeo-Bold", size: 18) ?? UIFont(), color: .black)
//        }
//
//        
//        if let article = product?.article {
//            articleLabel.label.text = "• Артикул: \(article)"
//        } else {
//            articleLabel.label.text = "• Артикул: Нет информации"
//        }
//        
//        if let title = product?.title {
//            titleLabel.label.text = "• Название: \(title)"
//        } else {
//            titleLabel.label.text = "• Название: Нет информации"
//        }
//        
//        if let colorID = product?.colorID {
//            colorLabel.label.text = "• Цвет: \(colorID)"
//        } else {
//            colorLabel.label.text = "• Цвет: Нет информации"
//        }
//        
//        if let material = product?.material {
//            materialLabel.label.text = "• Состав: \(material)"
//        } else {
//            materialLabel.label.text = "• Состав: Нет информации"
//        }
//        
//        if let description = product?.description {
//            descriptionLabel.label.text = "• Описание: \(description)"
//        } else {
//            descriptionLabel.label.text = "• Описание: Нет информации"
//        }
//        
//        if let price = product?.price {
//            priceLabel.label.text = "• Цена: \(price)"
//        } else {
//            priceLabel.label.text = "• Цена: Нет информации"
//        }
//    }

        
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
    
