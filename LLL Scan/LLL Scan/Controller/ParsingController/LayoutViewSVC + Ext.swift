//
//  LayoutViewPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func layoutView() {
        let labelForHtml = labelForHtml.label
        let imageForHtml = imageForHtml.imageView
        
        //MARK: - Label for HTML
        NSLayoutConstraint.activate([
            labelForHtml.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelForHtml.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelForHtml.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        //MARK: - Label for HTML
        NSLayoutConstraint.activate([
            imageForHtml.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageForHtml.widthAnchor.constraint(equalToConstant: 200),
            imageForHtml.heightAnchor.constraint(equalToConstant: 300),
            imageForHtml.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
        ])
    }
}
