//
//  CDCategory+CoreDataProperties.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 30/01/23.
//
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var category: String!

}

extension CDCategory : Identifiable {

}
