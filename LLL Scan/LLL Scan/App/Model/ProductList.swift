//
//  ProductList.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import Foundation
import RealmSwift

class ProductList: Object {
    @objc dynamic var id: String = UUID().uuidString
    var products = List<Product>()
    @objc dynamic var titleForCell: String = ""
    
    override static func primaryKey() -> String? {
            return "id"
        }
}


