//
//  LayoutViewPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    override func layoutView() {
        let buttonForAddNewTableView = buttonForAddNewTableView.button
        
        //MARK: - Button for add new table view for scaning
        NSLayoutConstraint.activate([
            buttonForAddNewTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonForAddNewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonForAddNewTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonForAddNewTableView.heightAnchor.constraint(equalToConstant: 44),
        ])
        
//        //MARK: - Label for HTML
//        NSLayoutConstraint.activate([
//            imageForHtml.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageForHtml.widthAnchor.constraint(equalToConstant: 200),
//            imageForHtml.heightAnchor.constraint(equalToConstant: 300),
//            imageForHtml.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            
//        ])
    }
}
