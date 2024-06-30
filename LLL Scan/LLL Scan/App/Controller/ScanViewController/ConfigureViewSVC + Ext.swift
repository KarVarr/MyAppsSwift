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
        
        overlayViewForScanner.vc.isHidden = true
    }
    
    //MARK: - URL Decoder for scanning
    func urlDecoder(url: String?) -> String? {
        if let mainImageURLString = url,
           let decodedMainImageURLString = mainImageURLString.removingPercentEncoding,
           let mainImageURL = URL(string: decodedMainImageURLString) {
            return mainImageURL.absoluteString
        } else {
            return nil
        }
    }
}


