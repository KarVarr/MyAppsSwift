//
//  CoreDataManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 15.05.2024.
//

import UIKit
import CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init() {}
    //APP DELEGATE
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    // CONTEXT
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    // Общий метод для выполнения fetch-запросов
    private func fetchRequest<T: NSManagedObject>(_ entityName: String, predicate: NSPredicate? = nil) -> [T] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = predicate
        do {
            return (try context.fetch(fetchRequest) as? [T]) ?? []
        } catch {
            print("Failed to fetch \(entityName): \(error)")
            return []
        }
    }
    
    // Save a single product to Core Data
    public func saveProduct(_ product: Product) {
        context.insert(product)
        appDelegate.saveContext()
    }
    
    // Fetch products from Core Data
    public func fetchProducts() -> [Product] {
        fetchRequest("Product")
    }
    
    // Clear all products from Core Data
    public func clearProducts() {
        let products: [Product] = fetchRequest("Product")
        products.forEach{ context.delete($0)}
        appDelegate.saveContext()
    }
    
    public func fetchProduct(_ id: UUID) -> Product? {
        let predicate = NSPredicate(format: "id == %@", id as CVarArg)
        return fetchRequest("Product", predicate: predicate).first
    }
    
    public func deleteProduct(with id: UUID) {
        let predicate = NSPredicate(format: "id == %@", id as CVarArg)
        if let product = fetchRequest("Product", predicate: predicate).first {
            context.delete(product)
            appDelegate.saveContext()
        }
    }
    
    public func createProduct(id: UUID?, imageURL: String?, link: String?, article: String?, title: String?, price: String?, color: String?, description: String?, material: String?, gender: String?, babyGender: String?, addedAt: Date?) -> Product? {
        guard let productEntityDescription = NSEntityDescription.entity(forEntityName: "Product", in: context) else {
            return nil
        }
        let product = Product(entity: productEntityDescription, insertInto: context)
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
        
        appDelegate.saveContext()
        return product
    }
}


