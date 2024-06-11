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
    
    // Группы отсканированных продуктов
    var scannedProductsGroups: [[Product]] = []
    
    
    var scannedProducts: [[Product]] {
        return scannedProductsGroups
    }
    
    func addProduct(_ product: Product) {
        CoreDataManager.shared.saveProduct(product)
    }
    
    func addScannedProducts(_ products: [Product]) {
        for product in products {
            addProduct(product)
        }
    }
    
    func addScannedProductsGroup(_ products: [Product]) {
        scannedProductsGroups.append(products)
    }
    
    func clearProductList() {
        CoreDataManager.shared.clearProducts()
    }
    
    private func saveScannedProducts() {
        // Сохранение scannedProducts в Core Data
        CoreDataManager.shared.clearProducts()  // Очистим текущие данные для перезаписи
        
        for productsArray in scannedProducts {
            for product in productsArray {
                addProduct(product)
            }
        }
    }
}


