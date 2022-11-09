//
//  EventTypesViewModelTests.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import XCTest
@testable import takehome

@MainActor
final class EventTypesViewModelTests: XCTestCase {
    
    let eventRepo = MockEventTypeRepository()
    let accountRepo = MockAccountRepository()
    var viewModel: EventTypesViewModel!
    
    var expectation: XCTestExpectation?
    var refreshed = false

    override func setUpWithError() throws {
        viewModel = takehome.EventTypesViewModel(accountRepo, eventRepo)
        viewModel.fetchData()
        viewModel.refreshable = self
        refreshed = false
        
        let exp = expectation(description: "Expect for refresh")
        let _ = XCTWaiter.wait(for: [exp], timeout: 0.01)
        
        XCTAssertTrue(refreshed, "Refresh not called")
    }

    func testRowCount() {
        XCTAssertEqual(viewModel.rowCount, mockEventTypes.count)
    }
    
    func testName() {
        XCTAssertEqual(viewModel.name(for: IndexPath(row: 0, section: 0)), mockEventTypes.first?.name)
    }
    
    func testEvent() {
        XCTAssertEqual(viewModel.event(for: IndexPath(row: 0, section: 0)), mockEventTypes.first)
    }
    
    func testColor() {
        XCTAssertEqual(viewModel.color(for: IndexPath(row: 0, section: 0)), mockEventTypes.first?.color)
    }

}

extension EventTypesViewModelTests: Refreshable {
    func refresh() {
        refreshed = true
        expectation?.fulfill()
    }
}
