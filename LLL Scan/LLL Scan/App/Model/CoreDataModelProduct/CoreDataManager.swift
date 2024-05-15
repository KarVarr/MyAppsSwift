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
    
    public func createProduct(id: UUID?, imageURL: String?, link: String?, article: String?, title: String?, price: String?, color: String?, description: String?, material: String?, gender: String?, babyGender: String?, addedAt: Date?) {
        
        
    }
}


