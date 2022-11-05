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
    private var eventTypes: [String:[EventType]] = [:]
    
    init(_ dataSource: EventTypeRemoteDataSourceProtocol? = nil) {
        self.dataSource = dataSource ?? EventTypeRemoteDataSource()
    }
}

extension EventTypeRepository: EventTypeRepositoryProtocol {
    mutating func getEventTypes(_ userURI: String) async throws -> [EventType] {
        guard let eventTypes = eventTypes[userURI] else {
            eventTypes[userURI] = try await dataSource.getEventTypes(userURI)
            return eventTypes[userURI] ?? []
        }
        return eventTypes
    }
}
