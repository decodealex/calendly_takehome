//
//  EventTypeDataSourceTests.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import XCTest
@testable import takehome

final class EventTypeDataSourceTests: XCTestCase {
    
    let networkService = MockNetworkService()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        networkService.data = nil
    }

    func testGetEventTypes() async throws  {
        let dataStore = EventTypeRemoteDataSource(networkService)
        networkService.data = try getData(fromJSON: "event_type")
        
        let events = try await dataStore.getEventTypes("")
        let testEvent = events[0]
        XCTAssertEqual(events.count, 3)
        
        XCTAssertEqual(testEvent.name, "15 minute ")
        XCTAssertEqual(testEvent.color, "#8247f5")
        XCTAssertEqual(testEvent.duration, 15)
        XCTAssertEqual(testEvent.schedulingUrl, "https://calendly.com/decode_alex/15-minute")
        XCTAssertEqual(testEvent.uri, "https://api.calendly.com/event_types/797e7be5-54c7-4443-a961-afb477a7fec0")
        XCTAssertEqual(testEvent.active, false)
        XCTAssertEqual(testEvent.kind, .solo)
    }

}
