//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var productList: [Product] {
        CoreDataManager.shared.fetchProducts()
    }
    
    var scannedProducts: [[Product]] {
        let allProducts = CoreDataManager.shared.fetchProducts()
        return [allProducts]
    }
    
    func addProduct(_ product: Product) {
        CoreDataManager.shared.saveProduct(product)
    }
    
    func addScannedProducts(_ products: [Product]) {
        for product in products {
            addProduct(product)
        }
    }
    
    func clearProductList() {
        CoreDataManager.shared.clearProducts()
    }
}


