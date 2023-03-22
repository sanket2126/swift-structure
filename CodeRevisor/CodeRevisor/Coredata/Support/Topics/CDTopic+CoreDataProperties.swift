//
//  CDTopic+CoreDataProperties.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 18/03/23.
//
//

import Foundation
import CoreData


extension CDTopic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTopic> {
        return NSFetchRequest<CDTopic>(entityName: "CDTopic")
    }

    @NSManaged public var answer: String?
    @NSManaged public var id: UUID!
    @NSManaged public var question: String!
    @NSManaged public var reference_urls: [URL]?
    @NSManaged public var category: CDCategory?

    func convertToTopic() -> Topic {
        return Topic(id: self.id, referal_urls: self.reference_urls, question: self.question, answer: self.answer, category: self.category?.convertToCategories())
    }
}

extension CDTopic : Identifiable {

}

