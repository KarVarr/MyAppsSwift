//
//  GroupAllProducts+CoreDataProperties.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 12.06.2024.
//
//

import Foundation
import CoreData


extension GroupAllProducts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupAllProducts> {
        return NSFetchRequest<GroupAllProducts>(entityName: "GroupAllProducts")
    }

    @NSManaged public var arrayProduct: [[Product]]?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension GroupAllProducts {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Product)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Product)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension GroupAllProducts : Identifiable {

}
