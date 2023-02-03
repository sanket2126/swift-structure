//
//  CategoryRepository.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 01/02/23.
//

import CoreData

struct Categories {
    let category: String
    let id: UUID
}

protocol CategoryRepository {
//    func create(category: CDCategory)
    func getAll() -> [Categories]?
//    func get(byIdentifier id: String) -> CDCategory?
//    func update(category: CDCategory) -> Bool
//    func delete(byIdentifier id: String) -> Bool
}

struct CategoryDataRepository: CategoryRepository {
//    func create(category: CDCategory) {
//        <#code#>
//    }
    
    func getAll() -> [Categories]? {
        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDCategory.self)
        
        var categories: [Categories] = []
        result?.forEach({
            categories.append($0.convertToCategories())
        })
        
        return  categories
    }
    
//    func get(byIdentifier id: String) -> CDCategory? {
//        <#code#>
//    }
//
//    func update(category: CDCategory) -> Bool {
//        <#code#>
//    }
//
//    func delete(byIdentifier id: String) -> Bool {
//        <#code#>
//    }
}
