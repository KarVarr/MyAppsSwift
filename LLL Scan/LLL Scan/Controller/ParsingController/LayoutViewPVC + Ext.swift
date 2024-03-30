//
//  LayoutViewPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ParsingVC {
    override func layoutView() {
        let labelForHtml = labelForHtml.label
        
        //MARK: - Label for HTML
        NSLayoutConstraint.activate([
            labelForHtml.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelForHtml.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
