//
//  DataSourceError.swift
//  CodeRevisor
//
//  Created by Sanket on 28/02/21.
//

import Foundation

//MARK: DataSourceError

extension AppError.Enums {
    enum DataSourceError {
        case noDataFound
        case noUserFound
        case custom(errorDescription: String?)
    }
}

extension AppError.Enums.DataSourceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noDataFound: return "No data found"
        case .noUserFound: return "No user found"
        case .custom(let errorDescription): return errorDescription
        }
    }
}
