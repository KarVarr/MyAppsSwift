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
    
    var productList = [Product]()
    var scannedProductsGroups = [[Product]]()
    
    func saveProduct(products: [Product]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(products)
            }
        } catch {
            print("error saving products: \(error)")
        }
    }
    
    func loadProducts() -> [Product] {
        do {
            let realm = try Realm()
            let products = realm.objects(Product.self)
            return Array(products)
        } catch {
            print("error loading products \(error)")
            return []
        }
    }
    
    func saveAllProducts(allProducts: [[Product]]) {
        do {
            let realm = try Realm()
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
    
    func loadAllProducts() -> [[Product]] {
        do {
            let realm = try Realm()
            let productLists = realm.objects(ProductList.self)
            var allProducts = [[Product]]()
            
            for productList in productLists {
                allProducts.append(Array(productList.products))
            }
            
            return allProducts
        } catch {
            print("error loading allProducts: \(error)")
            return []
        }
    }
    
}
