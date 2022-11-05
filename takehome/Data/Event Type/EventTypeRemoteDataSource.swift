//
//  EventTypeRemoteDataSource.swift
//  takehome
//
//

import Foundation

protocol EventTypeRemoteDataSourceProtocol {
    func getEventTypes(_ userURI: String) async throws -> [EventType]
}

struct EventTypeRemoteDataSource {
    private let networkManager: NetworkManagerProtocol
    private let decoder: JSONDecoder
    
    init(_ networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Date.iso8601FractionalSecondsFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}

extension EventTypeRemoteDataSource: EventTypeRemoteDataSourceProtocol {
    func getEventTypes(_ userURI: String) async throws -> [EventType] {
        let data = try await networkManager.get("https://api.calendly.com/event_types?user=\(userURI)")
        let eventTypesPayload = try decoder.decode(EventTypesPayload.self, from: data)
        return eventTypesPayload.collection
    }
}
