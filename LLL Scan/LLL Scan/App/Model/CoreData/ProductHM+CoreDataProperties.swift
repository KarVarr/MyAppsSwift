//
//  ProductHM+CoreDataProperties.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 13.05.2024.
//
//

import Foundation
import CoreData


extension ProductHM {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductHM> {
        return NSFetchRequest<ProductHM>(entityName: "ProductHM")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageURL: String?
    @NSManaged public var link: String?
    @NSManaged public var article: String?
    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var color: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var material: String?
    @NSManaged public var gender: String?
    @NSManaged public var babyGender: String?
    @NSManaged public var addedAt: Date?
    @NSManaged public var fullBlock: String?

}

extension ProductHM : Identifiable {

}
