//
//  AccountRemoteDataSourceTest.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import XCTest
@testable import takehome

final class AccountRemoteDataSourceTest: XCTestCase {
    
    let networkService = MockNetworkService()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        networkService.data = nil
    }

    func testGetAccount() async throws  {
        let dataStore = AccountRemoteDataSource(networkService)
        networkService.data = try getData(fromJSON: "user")
        
        let user = try await dataStore.getAccount()
        
        XCTAssertNil(user.avatarUrl)
        XCTAssertEqual(user.name, "Test User")
        XCTAssertEqual(user.schedulingUrl, "https://calendly.com/test_user")
        XCTAssertEqual(user.email, "test@gmail.com")
        XCTAssertEqual(user.uri, "https://api.calendly.com/users/ef1ddf97-4678-4acd-bd2c-6c0546852fa2")
        XCTAssertEqual(user.timezone, "America/Los_Angeles")
        XCTAssertEqual(user.createdAt, Date.dateFrom("2022-09-02T19:49:55.236158Z"))
        XCTAssertEqual(user.updatedAt, Date.dateFrom("2022-11-05T23:43:12.243979Z"))
    }

}
