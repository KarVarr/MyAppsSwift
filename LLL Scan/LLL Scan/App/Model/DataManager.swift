//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation
import RealmSwift

// Обновить номер версии схемы
let currentSchemaVersion: UInt64 = 1

class DataManager {
    static let shared = DataManager()
    let realm: Realm
    
    private init() {
        // Настройка миграции
        let config = Realm.Configuration(
            schemaVersion: currentSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < currentSchemaVersion {
                    // Автоматическое добавление нового свойства 'mainImageURL' (если необходимо)
                    migration.enumerateObjects(ofType: Product.className()) { oldObject, newObject in
                        newObject!["mainImageURL"] = ""
                    }
                }
            })
        
        Realm.Configuration.defaultConfiguration = config
        
        do {
            realm = try Realm()
        } catch {
            fatalError("Ошибка инициализации Realm: \(error)")
        }
    }
    
    var productList = [Product]()
    var allProducts = [[Product]]()
    
    //MARK: - SAVE Product
    func saveProduct(product: Product) {
        do {
            try realm.write {
                realm.add(product)
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
                let existingProductLists = realm.objects(ProductList.self)
                realm.delete(existingProductLists)
                
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
    
    // MARK: - DELETE Product List
    func deleteProductList(at index: Int) {
        do {
            try realm.write {
                let productListToDelete = realm.objects(ProductList.self)[index]
                realm.delete(productListToDelete)
                allProducts.remove(at: index)
            }
        } catch {
            print("Error deleting product list: \(error)")
        }
    }
    
    // MARK: - DELETE Product
    func deleteProduct(at index: Int) {
        do {
            try realm.write {
                if index < productList.count {
                    let productToDelete = productList[index]
                    realm.delete(productToDelete)
                    productList.remove(at: index)
                } else {
                    print("Index out of range")
                }
            }
        } catch {
            print("Error deleting product: \(error)")
        }
    }
    
}
