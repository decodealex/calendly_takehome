//
//  MockEventTypeRemoteDataSource.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import takehome

struct MockEventTypeRemoteDataSource: EventTypeRemoteDataSourceProtocol {
    func getEventTypes(_ userURI: String) async throws -> [takehome.EventType] {
        return mockEventTypes
    }
}
