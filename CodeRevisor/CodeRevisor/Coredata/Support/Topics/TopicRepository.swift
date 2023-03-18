//
//  TopicRepository.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 18/03/23.
//

import Foundation
import CoreData

struct Topic {
    let id: UUID
    let referal_urls: [URL]?
    let question: String
    let answer: String?
//    let category: Categories?
}

protocol TopicRepository {
    func create(topic: Topic)
    func getAll() -> [Topic]?
    func get(byID id: UUID) -> Topic?
    func update(topic: Topic) -> Bool
    func delete(byID id: UUID) -> Bool
}

struct TopicDataRepository: TopicRepository {
    var persistantStorage: PersistantStorage!
    
    func create(topic: Topic) {
        let exist = getAll()?.contains(where: { $0.question.removeAllSpace().lowercased() == topic.question.removeAllSpace().lowercased() }) ?? false
        if !exist {
            let tp = CDTopic(context: persistantStorage.persistentContainer.viewContext)
            tp.question = topic.question
            tp.answer = topic.answer
//            tp.category = topic.category.c
            tp.reference_urls = topic.referal_urls
            tp.id = topic.id
            persistantStorage.saveContext()
        } else {
            Alert.shared.showSnackBar("Already exists",isError: true)
        }
    }
    
    func getAll() -> [Topic]? {
        let result = persistantStorage.fetchManagedObject(managedObject: CDTopic.self)
        
        var topic: [Topic] = []
        result?.forEach({
            topic.append($0.convertToTopic())
        })
        
        return topic
    }
    
    func get(byID id: UUID) -> Topic? {
        let result = getCDTopic(byId: id)
        return result?.convertToTopic()
    }

    func update(topic: Topic) -> Bool {
        let cdTopic = getCDTopic(byId: topic.id)
        guard cdTopic != nil else { return false }
        cdTopic?.question = topic.question
        cdTopic?.answer = topic.answer
//        cdTopic?.category = topic.category.
        cdTopic?.reference_urls = topic.referal_urls
        persistantStorage.saveContext()
        return true
    }

    func delete(byID id: UUID) -> Bool {
        let cdCategory = getCDTopic(byId: id)
        guard let d = cdCategory else { return false }
        
        persistantStorage.persistentContainer.viewContext.delete(d)
        persistantStorage.saveContext()
        return true
    }
    
    private func getCDTopic(byId id: UUID) -> CDTopic? {
        let fetchRequest = NSFetchRequest<CDTopic>(entityName: "CDTopic")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try persistantStorage.persistentContainer.viewContext.fetch(fetchRequest).first
//            guard let data = result?.convertToCategories() else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
