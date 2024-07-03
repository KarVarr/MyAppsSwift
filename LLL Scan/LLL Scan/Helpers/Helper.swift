//
//  Helper.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

enum Helper {
    //MARK: - KEYS
    enum Keys {
        static let scanVCCellKey = "scanVCCellKey"
        static let filesVCCellKey = "filesVCCellKey"
        static let listOfProducts = "filesVCCellKey"
        static let productDetails = "productDetailsCellKey"
        static let productDetailsCellHeader = "productDetailsCellHeaderKey"
    }
    
    //MARK: - Fonts
    enum Fonts {
        static func dynamicFontSize(_ fontSize: CGFloat) -> CGFloat {
            let screenWidth = UIScreen.main.bounds.size.width
            let calculatedFontSize = screenWidth / 375 * fontSize
            return calculatedFontSize
        }
    }
    
    //MARK: - Dates
    enum Dates {
        static func formatDate(_ date: Date?) -> String {
            guard let date = date else { return "(нет информации)" }
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            return formatter.string(from: date)
        }
    }
    
    //MARK: - URL Decoder for scanning
    enum URLs {
        static func urlDecoder(url: String?) -> String? {
            if let mainImageURLString = url,
               let decodedMainImageURLString = mainImageURLString.removingPercentEncoding,
               let mainImageURL = URL(string: decodedMainImageURLString) {
                return mainImageURL.absoluteString
            } else {
                return nil
            }
        }
    }
}
