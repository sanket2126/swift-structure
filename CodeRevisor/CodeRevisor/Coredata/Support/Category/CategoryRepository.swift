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
    func get(byID id: UUID) -> Categories?
    func update(category: Categories) -> Bool
    func delete(byID id: UUID) -> Bool
}

struct CategoryDataRepository: CategoryRepository {
    
    func create(category: Categories) {
        let exist = getAll()?.contains(where: { $0.category.removeAllSpace().lowercased() == category.category.removeAllSpace().lowercased() }) ?? false
        if !exist {
            let cat = CDCategory(context: PersistantStorage.shared.context)
            cat.category = category.category
            cat.id = category.id
            PersistantStorage.shared.saveContext()
        } else {
            Alert.shared.showSnackBar("Already exists",isError: true)
        }
    }
    
    func getAll() -> [Categories]? {
        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDCategory.self)
        
        var categories: [Categories] = []
        result?.forEach({
            categories.append($0.convertToCategories())
        })
        
        return  categories
    }
    
    func get(byID id: UUID) -> Categories? {
        let result = getCDCategory(byId: id)
        return result?.convertToCategories()
    }

    func update(category: Categories) -> Bool {
        let cdCategory = getCDCategory(byId: category.id)
        guard cdCategory != nil else { return false }
        cdCategory?.category = category.category
        PersistantStorage.shared.saveContext()
        return true
    }

    func delete(byID id: UUID) -> Bool {
        let cdCategory = getCDCategory(byId: id)
        guard let d = cdCategory else { return false }
        
        PersistantStorage.shared.context.delete(d)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDCategory(byId id: UUID) -> CDCategory? {
        let fetchRequest = NSFetchRequest<CDCategory>(entityName: "CDCategory")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
//            guard let data = result?.convertToCategories() else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
