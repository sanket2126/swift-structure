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
    func create(category: Categories)
    func getAll() -> [Categories]?
//    func get(byIdentifier id: String) -> Categories?
//    func update(category: Categories) -> Bool
//    func delete(byIdentifier id: String) -> Bool
}

struct CategoryDataRepository: CategoryRepository {
    
    func create(category: Categories) {
        let cat = CDCategory(context: PersistantStorage.shared.context)
        cat.category = category.category
        cat.id = category.id
        PersistantStorage.shared.saveContext()
    }
    
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
