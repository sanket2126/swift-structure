//
//  CategoryManager.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 03/02/23.
//

import Foundation

struct CategoryManager {
    private let _categoryRepo = CategoryDataRepository()
    
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
    
    func deleteCategory(category: Categories) -> Bool {
        _categoryRepo.delete(byID: category.id)
    }
}
