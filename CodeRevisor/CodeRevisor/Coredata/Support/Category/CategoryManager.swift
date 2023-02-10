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
    
//    func fetchCategory(byID : UUID) -> Categories? {
//    }
    
//    func updateCategory(category: Categories) -> Bool {
//    }
    
//    func deleteCategory(category: Categories) -> Bool {
//    }
}
