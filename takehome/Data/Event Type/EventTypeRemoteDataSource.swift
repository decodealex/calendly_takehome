//
//  EventTypeRemoteDataSource.swift
//  takehome
//
//

import Foundation
import CalendlyNetworkService

protocol EventTypeRemoteDataSourceProtocol {
    func getEventTypes(_ userURI: String) async throws -> [EventType]
}

struct EventTypeRemoteDataSource {
    private let networkManager: NetworkManagerProtocol
    private let decoder: JSONDecoder
    
    init(_ networkManager: NetworkManagerProtocol = NetworkManager.shared, decoder: JSONDecoder = .defaultDecoder) {
        self.networkManager = networkManager
        self.decoder = decoder
    }
}

extension EventTypeRemoteDataSource: EventTypeRemoteDataSourceProtocol {
    func getEventTypes(_ userURI: String) async throws -> [EventType] {
        let data = try await networkManager.request(urlSession: .shared, endpoint: EventTypeEndpoint.getUserEvents(userURI))
        let eventTypesPayload = try decoder.decode(EventTypesPayload.self, from: data)
        return eventTypesPayload.collection
        
    }
}
