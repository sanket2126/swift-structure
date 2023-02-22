//
//  CodeRevisorTests.swift
//  CodeRevisorTests
//
//  Created by Sanket Parmar on 22/02/23.
//

import XCTest
@testable import CodeRevisor

final class CodeRevisorTests: XCTestCase {
    
    var persistentStorage: PersistantStorage!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        persistentStorage = PersistantStorage(storeType: .inMemory)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateCategory_return_Sucess() {
        let uid = UUID()
        let category = Categories(category: "Test", id: uid)
        
        let manager = CategoryManager(persistantStorage: persistentStorage)
        manager.createCategory(category: category)
        
        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
        
        XCTAssertEqual(data?.count, 1)
        XCTAssertEqual(data?.first?.category, category.category)
    }
    
    func testCreateDuplicateCategory_return_Failure() {
        let uid = UUID()
        let category = Categories(category: "Test", id: uid)
        
        let uid2 = UUID()
        let category2 = Categories(category: "te st ", id: uid2)
        
        let manager = CategoryManager(persistantStorage: persistentStorage)
        manager.createCategory(category: category)
        
        manager.createCategory(category: category2)
        
        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
        
        XCTAssertEqual(data?.count, 1)
    }
    
    func testFetchCategory_return_Failure() {
        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
        
        XCTAssertEqual(data?.count, 0)
    }
    
    func testUpdateCategory_return_Success() {
        let uid = UUID()
        let category = Categories(category: "Test", id: uid)
        
        let manager = CategoryManager(persistantStorage: persistentStorage)
        manager.createCategory(category: category)
        
        let updateCategory = Categories(category: "Updated Test", id: uid)
        let result = manager.updateCategory(category: updateCategory)
        
        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
        
        XCTAssertEqual(result, true)
        XCTAssertEqual(data?.first?.category, updateCategory.category)
    }
    
    func testDeleteCategory_return_Success() {
        let uid = UUID()
        let category = Categories(category: "Test", id: uid)
        
        let manager = CategoryManager(persistantStorage: persistentStorage)
        manager.createCategory(category: category)
        
        let result = manager.deleteCategory(id: category.id)
        
        let data = persistentStorage.fetchManagedObject(managedObject: CDCategory.self)
        
        XCTAssertEqual(result, true)
        XCTAssertEqual(data?.count, 0)
    }

}
