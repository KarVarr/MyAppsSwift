//
//  File.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 28.06.2024.
//

import Foundation
import RealmSwift

class File: Object {
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var createdAt: Date = Date()
    
    let products = List<Product>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

