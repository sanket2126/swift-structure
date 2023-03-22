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
    @NSManaged public var topic: Set<CDTopic>?

    func convertToCategories() -> Categories {
        return Categories(category: self.category, id: self.id, topic: self.convertToTopic())
    }
    
    private func convertToTopic() -> [Topic]? {
        
        guard self.topic != nil && self.topic?.count != 0 else { return nil }
        var topics: [Topic] = []
        
        self.topic?.forEach({ topic in
            topics.append(topic.convertToTopic())
        })
        return topics
    }
}

// MARK: Generated accessors for topic
extension CDCategory {

    @objc(addTopicObject:)
    @NSManaged public func addToTopic(_ value: CDTopic)

    @objc(removeTopicObject:)
    @NSManaged public func removeFromTopic(_ value: CDTopic)

    @objc(addTopic:)
    @NSManaged public func addToTopic(_ values: Set<CDTopic>)

    @objc(removeTopic:)
    @NSManaged public func removeFromTopic(_ values: Set<CDTopic>)

}

extension CDCategory : Identifiable {

}
