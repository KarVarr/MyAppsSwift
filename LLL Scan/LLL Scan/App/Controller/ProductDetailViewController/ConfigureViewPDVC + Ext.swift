//
//  ConfigureViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

extension ProductDetailVC {
    override func configureView() {
        view.backgroundColor = .lightGray
        title = "Карточки товара"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let convertFileToCVSButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .plain, target: self, action: #selector(shareButtonToConvertFile))
        navigationItem.rightBarButtonItem = convertFileToCVSButton
    }
    
    @objc func shareButtonToConvertFile() {
        print("convert file done")
    }
}
