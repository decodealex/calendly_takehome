//
//  EventTypeRepository.swift
//  takehome
//
//

import Foundation

protocol EventTypeRepositoryProtocol {
    mutating func getEventTypes(_ userURI: String) async throws -> [EventType]
}

struct EventTypeRepository {
    private let dataSource: EventTypeRemoteDataSourceProtocol
    private var eventTypes: [EventType] = []
    
    init(_ dataSource: EventTypeRemoteDataSourceProtocol? = nil) {
        self.dataSource = dataSource ?? EventTypeRemoteDataSource()
    }
}

extension EventTypeRepository: EventTypeRepositoryProtocol {
    mutating func getEventTypes(_ userURI: String) async throws -> [EventType] {
        eventTypes = try await dataSource.getEventTypes(userURI)
        return eventTypes
    }
}
