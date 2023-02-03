//
//  NewCategoryViewModel.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 03/02/23.
//

import Foundation

class NewCategoryViewModel {
    
    //MARK:- Class Variable
    private(set) var result = Bindable<Result<String?, AppError>>()
//    private var categories: [Categories] = []
    private var manager = CategoryManager()
    
    //MARK:- Deinit
    deinit {
        debugPrint("‼️‼️‼️ deinit view model : \(self) ‼️‼️‼️")
    }
}

// MARK: Validation Methods
extension NewCategoryViewModel {
    
    /// Validate fields
    /// - Returns: If any validation error found return error message else nil.
    private func isValidView(category: String) -> AppError? {
        
        guard !category.isEmpty else { return AppError.validation(type: .category) }
        return nil
    }
}

//extension NewCategoryViewModel {
//
//    func create(category: Categories) -> AppError? {
//        manager.
//    }
//}
