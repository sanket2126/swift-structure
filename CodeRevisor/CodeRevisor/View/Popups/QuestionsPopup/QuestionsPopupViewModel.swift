//
//  QuestionsPopupViewModel.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 11/03/23.
//

import Foundation

class QuestionsPopupModel {
    
    //MARK:- Class Variable
    private(set) var result = Bindable<Result<String?, AppError>>()
    private var categories: [Categories] = []
    private var manager = CategoryManager()
    private var selectedCategory: Categories?
    
    convenience init(selectedCategory: Categories? = nil) {
        self.init()
        self.selectedCategory = selectedCategory
    }
    
    //MARK:- Deinit
    deinit {
        debugPrint("‼️‼️‼️ deinit view model : \(self) ‼️‼️‼️")
    }
}

// MARK: Cell methods
extension QuestionsPopupModel {

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
    
    func set(category data: Categories) {
        selectedCategory = data
    }
    
    func getSelectedt() -> Categories? {
        selectedCategory
    }
}

extension QuestionsPopupModel {

    func fetchAll() {
        categories = manager.fetchCategory() ?? []
        result.value = .success(nil)
    }
}
