//
//  CategoryManager.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 03/02/23.
//

import Foundation

struct CategoryManager {
    private var persistantStorage : PersistantStorage!
    private let _categoryRepo: CategoryDataRepository!
    
    init(persistantStorage: PersistantStorage = PersistantStorage.shared) {
        self.persistantStorage = persistantStorage
        _categoryRepo = CategoryDataRepository(persistantStorage: self.persistantStorage)
    }
    
    func createCategory(category: Categories) {
        _categoryRepo.create(category: category)
    }
    
    func fetchCategory() -> [Categories]? {
        _categoryRepo.getAll()
    }
    
    func fetchCategory(byID : UUID) -> Categories? {
        _categoryRepo.get(byID: byID)
    }
    
    func updateCategory(category: Categories) -> Bool {
        _categoryRepo.update(category: category)
    }
    
    func deleteCategory(id : UUID) -> Bool {
        _categoryRepo.delete(byID: id)
    }
}
