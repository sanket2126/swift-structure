//
//  HomeViewModel.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 03/02/23.
//

import Foundation

class HomeViewModel {
    
    //MARK:- Class Variable
    private(set) var result = Bindable<Result<String?, AppError>>()
    private var categories: [Categories] = []
    private var manager = CategoryManager()
    
    //MARK:- Deinit
    deinit {
        debugPrint("‼️‼️‼️ deinit view model : \(self) ‼️‼️‼️")
    }
}

// MARK: Cell methods
extension HomeViewModel {

    /// Get list count.
    /// - Returns: Return list count.
    func numberOfListRow() -> Int {
        categories.count
    }

    /// Get list row.
    /// - Parameter index: Table index.
    /// - Returns: Return List object data.
    func listRow(for index: Int) -> Categories {
        categories[index]
    }
}

extension HomeViewModel {

    func fetchAll() {
        categories = manager.fetchCategory() ?? []
        result.value = .success(nil)
    }
    
    func deleteCategory(index: IndexPath?) {
        if let i = index?.item, manager.deleteCategory(category: categories[i]) {
            fetchAll()
        } else {
            Alert.shared.showSnackBar("Error while deleting", isError: true)
        }
    }
}
