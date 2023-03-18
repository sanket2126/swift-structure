//
//  CDCategory+CoreDataProperties.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 18/03/23.
//
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var category: String!
    @NSManaged public var id: UUID!
    @NSManaged public var topic: NSSet?

    func convertToCategories() -> Categories {
        return Categories(category: self.category, id: self.id)
    }
}

// MARK: Generated accessors for topic
extension CDCategory {

    @objc(addTopicObject:)
    @NSManaged public func addToTopic(_ value: CDTopic)

    @objc(removeTopicObject:)
    @NSManaged public func removeFromTopic(_ value: CDTopic)

    @objc(addTopic:)
    @NSManaged public func addToTopic(_ values: NSSet)

    @objc(removeTopic:)
    @NSManaged public func removeFromTopic(_ values: NSSet)

}

extension CDCategory : Identifiable {

}
