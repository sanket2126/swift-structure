//
//  PersistantStorage.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 30/01/23.
//

import Foundation
import CoreData

enum StoreType {
  case inMemory, onDisk
}

//protocol PersistentStore {
//    var persistentContainer: NSPersistentContainer { get set }
//    func saveContext()
//    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
//}

// MARK: - Core Data stack
class PersistantStorage {

    static let shared: PersistantStorage = PersistantStorage()
    
//    lazy var context = persistentContainer.viewContext
    let persistentContainer: NSPersistentContainer = NSPersistentContainer(name: "CodeRevisor")

    init(storeType: StoreType = .onDisk) {

        if storeType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            description.type = NSInMemoryStoreType
            persistentContainer.persistentStoreDescriptions = [description]
        }
        
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    // MARK: - Core Data Saving support
    func saveContext () {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try persistentContainer.viewContext.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            
            return result
        } catch let error {
            debugPrint("\n\n\t Error while fetching from CoreData ❌ \(managedObject) ❌\n \(error)")
        }
        return nil
    }
}
