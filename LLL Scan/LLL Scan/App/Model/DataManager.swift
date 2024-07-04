//
//  DataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.04.2024.
//

import Foundation
import RealmSwift

// Обновить номер версии схемы
let currentSchemaVersion: UInt64 = 4

class DataManager {
    static let shared = DataManager()
    let realm: Realm
    
    private init() {
        // Настройка миграции
        let config = Realm.Configuration(
            schemaVersion: currentSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < currentSchemaVersion {
                    migration.enumerateObjects(ofType: ProductList.className()) { oldObject, newObject in
                        newObject!["category"] = ""
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
    
    //MARK: - SAVE ProductList TitleForCell
    func saveProductList(_ products: [Product], withTitle title: String) {
        do {
            try realm.write {
                let productList = ProductList()
                productList.products.append(objectsIn: products)
                productList.titleForCell = title
                realm.add(productList)
                print("Saved ProductList with title: \(title)")
            }
        } catch {
            print("Error saving products: \(error)")
        }
    }
    
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
    
    //MARK: - SAVE ALL Products
    func saveAllProducts(_ allProducts: [[Product]], withTitles titles: [String]) {
        do {
            try realm.write {
                let existingProductLists = realm.objects(ProductList.self)
                realm.delete(existingProductLists)
                
                for (index, productArray) in allProducts.enumerated() {
                    let productList = ProductList()
                    productList.products.append(objectsIn: productArray)
                    if index < titles.count {
                        productList.titleForCell = titles[index]
                    } else {
                        productList.titleForCell = "Партия: \(index + 1)"
                    }
                    realm.add(productList)
                }
            }
        } catch {
            print("Error saving allProducts: \(error)")
        }
    }
    
    //MARK: - LOAD Product
    func loadProducts() -> [Product] {
        let products = realm.objects(Product.self)
        return Array(products)
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
    
    //MARK: - LOAD All Product Lists
    func loadAllProductLists() -> [ProductList] {
        Array(realm.objects(ProductList.self))
    }
    
    // MARK: - DELETE Product List
    func deleteProductList(at index: Int) {
        do {
            if realm.isInWriteTransaction {
                let productListToDelete = realm.objects(ProductList.self)[index]
                realm.delete(productListToDelete)
                allProducts.remove(at: index)
            } else {
                try realm.write {
                    let productListToDelete = realm.objects(ProductList.self)[index]
                    realm.delete(productListToDelete)
                    allProducts.remove(at: index)
                }
            }
        } catch {
            print("Error deleting product list: \(error)")
        }
    }
    
    // MARK: - DELETE Product
    func deleteProduct(at index: Int, inProductListAt productListIndex: Int) {
        do {
            if realm.isInWriteTransaction {
                if productListIndex < allProducts.count && index < allProducts[productListIndex].count {
                    let productToDelete = allProducts[productListIndex][index]
                    realm.delete(productToDelete)
                    allProducts[productListIndex].remove(at: index)
                    
                    if allProducts[productListIndex].isEmpty {
                        deleteProductList(at: productListIndex)
                    }
                } else {
                    print("Index out of range")
                }
            } else {
                try realm.write {
                    if productListIndex < allProducts.count && index < allProducts[productListIndex].count {
                        let productToDelete = allProducts[productListIndex][index]
                        realm.delete(productToDelete)
                        allProducts[productListIndex].remove(at: index)
                        
                        if allProducts[productListIndex].isEmpty {
                            deleteProductList(at: productListIndex)
                        }
                    } else {
                        print("Index out of range")
                    }
                }
            }
        } catch {
            print("Error deleting product: \(error)")
        }
    }
    
    // MARK: - DELETE All Products
    func deleteAllProducts() {
        do {
            try realm.write {
                let allProductLists = realm.objects(ProductList.self)
                realm.delete(allProductLists)
                self.allProducts.removeAll()
            }
        } catch {
            print("Error deleting all products: \(error)")
        }
    }
}
