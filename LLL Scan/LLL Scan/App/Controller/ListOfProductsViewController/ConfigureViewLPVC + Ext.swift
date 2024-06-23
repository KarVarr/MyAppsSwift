//
//  ConfigureViewLPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import CoreXLSX

extension ListOfProductsVC {
    override func configureView() {
        view.backgroundColor = .lightGray
        title = "Карточки товара"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let convertFileToCSVButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .plain, target: self, action: #selector(shareButtonToConvertFile))
        navigationItem.rightBarButtonItem = convertFileToCSVButton
    }
        
    @objc func shareButtonToConvertFile() {
        print("convert file done")
        
        guard let productListIndex = productListIndex else {
            print("productListIndex is nil")
            return
        }
        
        let file_name = "H&M articuls.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(file_name)
        var csvHead = "Article,Title,Price,Color,Description,Material,link,ImageLink\n"
        
        let productsContainer = dataManager.allProducts[productListIndex]
        
        for product in productsContainer {
            csvHead.append("\(String(describing: product.article ?? "")),\(String(describing: product.title ?? "")),\(String(describing: product.price ?? "")),\(String(describing: product.colorName ?? "")),\(String(describing: product.descriptions ?? "")),\(String(describing: product.material ?? "")),\(String(describing: product.link ?? "")),\(String(describing: product.imageURL ?? ""))\n")
        }
        
        do {
            try csvHead.write(to: path!, atomically: true, encoding: .utf8)
            let exportSheet = UIActivityViewController(activityItems: [path as Any], applicationActivities: nil)
            self.present(exportSheet, animated: true)
        } catch  {
            print("Error CSV ------>>>>>>>")
        }
    }
    
}
