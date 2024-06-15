//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    let realm = try! Realm()
    
    var productList = [Product]()
    var allProducts = [[Product]]()
    
    //MARK: - SAVE Product
    func saveProduct(product: Product) {
        do {
            try realm.write {
                realm.add(product, update: .modified)
            }
        } catch {
            print("error saving products: \(error)")
        }
    }
    //MARK: - LOAD Product
    func loadProducts() -> [Product] {
        let products = realm.objects(Product.self)
        return Array(products)
    }
    
    //MARK: - SAVE ALL Products
    func saveAllProducts(_ allProducts: [[Product]]) {
        do {
            try realm.write {
                for productArray in allProducts {
                    let productList = ProductList()
                    productList.products.append(objectsIn: productArray)
                    realm.add(productList)
                }
            }
        } catch {
            print("Error saving allProducts: \(error)")
        }
    }
    
    //MARK: - LOAD ALL Products
    func loadAllProducts() -> [[Product]] {
        let productLists = realm.objects(ProductList.self)
        var allProducts = [[Product]]()
        
        for productList in productLists {
            allProducts.append(Array(productList.products))
        }
        
        return allProducts
    }
    
}
