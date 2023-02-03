//
//  ValidationError.swift
//  CodeRevisor
//
//  Created by Sanket on 03/03/21.
//

import Foundation

extension AppError.Enums {
    enum ValidationError {

        case category
        case custom(errorDescription: String?)
    }
}

extension AppError.Enums.ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .category: return "Category should not be empty."
        case .custom(let errorDescription): return errorDescription
        }
    }
}
