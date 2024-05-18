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
        return splitProductsIntoGroups(allProducts)
    }
    
    private func splitProductsIntoGroups(_ products: [Product]) -> [[Product]] {
        var groupedProducts = [[Product]]()
        let groupedByDate = Dictionary(grouping: products) { $0.addedAt?.startOfDay ?? Date() }
        for (_, products) in groupedByDate {
            groupedProducts.append(products)
        }
        return groupedProducts
    }
}

// Расширение для получения начала дня для Date
extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
