//
//  Product.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import Foundation
import RealmSwift

class Product: Object {
    @objc dynamic var id: UUID?
    @objc dynamic var imageURL: String?
    @objc dynamic var link: String?
    @objc dynamic var article: String?
    @objc dynamic var title: String?
    @objc dynamic var price: String?
    @objc dynamic var colorName: String?
    @objc dynamic var descriptions: String?
    @objc dynamic var material: String?
    @objc dynamic var gender: String?
    @objc dynamic var babyGender: String?
    @objc dynamic var addedAt: Date?
}
