//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation

//class DataManager {
//    static let shared = DataManager()
//    
//    var productList: [Product] {
//        CoreDataManager.shared.fetchProducts()
//    }
//    
//    // Группы отсканированных продуктов
//    var scannedProductsGroups: [[Product]] = []
//    
//    
//    
//    var scannedProducts: [[Product]] {
//        return scannedProductsGroups
//    }
//    
//    init() {
//        loadScannedProducts()
//    }
//    
//    func addProduct(_ product: Product) {
//        CoreDataManager.shared.saveProduct(product)
//    }
//    
//    func addScannedProducts(_ products: [Product]) {
//        for product in products {
//            addProduct(product)
//        }
//    }
//    
//    func addScannedProductsGroup(_ products: [Product]) {
//        scannedProductsGroups.append(products)
//    }
//    
//    func clearProductList() {
//        CoreDataManager.shared.clearProducts()
//    }
//    
//    func saveScannedProducts() {
//        CoreDataManager.shared.clearProducts()
//        for productsArray in scannedProducts {
//            for product in productsArray {
//                addProduct(product)
//            }
//        }
//    }
//    
//    
//    func loadScannedProducts() {
//        let allProducts = CoreDataManager.shared.fetchProducts()
//        scannedProductsGroups = [allProducts]
//    }
//    
//}
//
//
