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
    
    func deleteCategory(category: Categories) -> Bool {
        _categoryRepo.delete(byID: category.id)
    }
}

//final class CategoryManagerTest: XCTestCase {
//
//    var persistentStorage: PersistantStorage!
//    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        persistentStorage = PersistantStorage(storeType: .inMemory)
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testCreateCategory_return_Sucess() {
//        let uid = UUID()
//        let category = Categories(category: "Test", id: uid)
//        
//        let manager = CategoryManager(persistantStorage: persistentStorage)
//        manager.createCategory(category: category)
//        
//        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
//        
//        XCTAssertEqual(data?.count, 1)
//        XCTAssertEqual(data?.first?.category, category.category)
//    }
//
//}
