//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var productList = ProductList()
    var scannedProducts = ScannedProducts()
}
