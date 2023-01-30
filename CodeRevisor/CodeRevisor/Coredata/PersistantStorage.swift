//
//  PersistantStorage.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 30/01/23.
//

import Foundation
import CoreData

// MARK: - Core Data stack
final class PersistantStorage {
    
    static let shared = PersistantStorage()
    lazy var context = persistentContainer.viewContext
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CodeRevisor")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try PersistantStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            
            return result
        } catch let error {
            debugPrint("\n\n\t Error while fetching from CoreData ❌ \(managedObject) ❌\n \(error)")
        }
        return nil
    }
}
