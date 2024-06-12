//
//  CoreManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 12.06.2024.
//

import Foundation
import CoreData


class CoreManager {
    static let shared = CoreManager()
    var products = [Product]()
    var allProducts = GroupAllProducts()
    private init() {
        
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ProductsCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                //                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetchAllProducts() {
        let request = Product.fetchRequest()
        if let products = try? persistentContainer.viewContext.fetch(request) {
            self.products = products
        }
    }
    
    
    func addScannedProductsGroup(_ products: [Product]) {
        allProducts.arrayProduct?.append(products)
        allProducts.
    }
    
    func createProduct(id: UUID?, imageURL: String?, link: String?, article: String?, title: String?, price: String?, color: String?, description: String?, material: String?, gender: String?, babyGender: String?, addedAt: Date?) -> Product? {
        
        let product = Product(context: persistentContainer.viewContext)
        product.id = id
        product.imageURL = imageURL
        product.link = link
        product.article = article
        product.title = title
        product.price = price
        product.color = color
        product.descriptions = description
        product.material = material
        product.gender = gender
        product.babyGender = babyGender
        product.addedAt = addedAt
        
        saveContext()
        fetchAllProducts()
        return product
    }
    
    func addNewProduct(product: Product) {
        let newProduct = Product(context: persistentContainer.viewContext)
        newProduct.id = product.id
        newProduct.imageURL = product.imageURL
        newProduct.link = product.link
        newProduct.article = product.article
        newProduct.title = product.title
        newProduct.price = product.price
        newProduct.color = product.color
        newProduct.descriptions = product.descriptions
        newProduct.material = product.material
        newProduct.gender = product.gender
        newProduct.babyGender = product.babyGender
        newProduct.addedAt = product.addedAt
        
        saveContext()
        products.append(newProduct)
        fetchAllProducts()
    }
}
