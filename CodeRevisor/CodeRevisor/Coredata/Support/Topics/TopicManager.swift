//
//  TopicManager.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 18/03/23.
//

import Foundation

struct TopicManager {
    private var persistantStorage : PersistantStorage!
    private let _topicRepo: TopicDataRepository!
    
    init(persistantStorage: PersistantStorage = PersistantStorage.shared) {
        self.persistantStorage = persistantStorage
        _topicRepo = TopicDataRepository(persistantStorage: self.persistantStorage)
    }
    
    func createTopic(topic: Topic) {
        _topicRepo.create(topic: topic)
    }
    
    func fetchTopic() -> [Topic]? {
        _topicRepo.getAll()
    }
    
    func fetchTopic(byID : UUID) -> Topic? {
        _topicRepo.get(byID: byID)
    }
    
    func updateTopic(topic: Topic) -> Bool {
        _topicRepo.update(topic: topic)
    }
    
    func deleteTopic(id : UUID) -> Bool {
        _topicRepo.delete(byID: id)
    }
}
