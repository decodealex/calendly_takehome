//
//  JSONMappingTests.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import XCTest
@testable import takehome

final class JSONMappingTests: XCTestCase {
    
    let decoder: JSONDecoder = JSONDecoder.defaultDecoder

    func testUserDecodingTest() throws {
        let data = try getData(fromJSON: "user")
        let user = try decoder.decode(AccountPayload.self, from: data).resource
        
        XCTAssertNil(user.avatarUrl)
        XCTAssertEqual(user.name, "Test User")
        XCTAssertEqual(user.schedulingUrl, "https://calendly.com/test_user")
        XCTAssertEqual(user.email, "test@gmail.com")
        XCTAssertEqual(user.uri, "https://api.calendly.com/users/ef1ddf97-4678-4acd-bd2c-6c0546852fa2")
        XCTAssertEqual(user.timezone, "America/Los_Angeles")
        XCTAssertEqual(user.createdAt, Date.dateFrom("2022-09-02T19:49:55.236158Z"))
        XCTAssertEqual(user.updatedAt, Date.dateFrom("2022-11-05T23:43:12.243979Z"))
    }
    
    func testEventTypeDecoding() throws {
        let data = try getData(fromJSON: "event_type")
        let events = try decoder.decode(EventTypesPayload.self, from: data).collection
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
