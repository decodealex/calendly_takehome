//
//  MockEventTypeRepository.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import takehome

struct MockEventTypeRepository: EventTypeRepositoryProtocol {
    func getEventTypes(_ userURI: String) async throws -> [EventType] {
        return mockEventTypes
    }
}
