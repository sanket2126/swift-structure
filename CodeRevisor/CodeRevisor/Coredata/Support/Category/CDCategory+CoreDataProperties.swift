//
//  CDCategory+CoreDataProperties.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 03/02/23.
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

    func convertToCategories() -> Categories {
        return Categories(category: self.category, id: self.id)
    }
}

extension CDCategory : Identifiable {

}
