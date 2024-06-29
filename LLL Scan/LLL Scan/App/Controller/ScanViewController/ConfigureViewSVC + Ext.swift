//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation
import UIKit

extension ScanVC {
    override func configureView() {
        view.backgroundColor = .white
        title = "LL Scan ☺︎  ☻  ⚇"
        let deleteAll = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteAllButton))
        navigationItem.rightBarButtonItem = deleteAll
        
        overlayViewForScanner.vc.isHidden = true
    }
    
    //MARK: - URL Decoder for scanning
    func urlDecoder(url: String?) -> String? {
        if let mainImageURLString = url,
           let decodedMainImageURLString = mainImageURLString.removingPercentEncoding,
           let mainImageURL = URL(string: "https:"+decodedMainImageURLString) {
            return mainImageURL.absoluteString
        } else {
            return nil
        }
    }
}


