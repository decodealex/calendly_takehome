//
//  MockAccount.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import takehome

let mockAccount: Account = Account(
    uri: "https://api.calendly.com/users/ef1ddf97-4678-4acd-bd2c-6c0546852fa2",
    name: "Test User",
    avatarUrl: nil,
    schedulingUrl: "https://calendly.com/test_user",
    createdAt: Date.dateFrom("2022-09-02T19:49:55.236158Z")!,
    updatedAt: Date.dateFrom("2022-11-05T23:43:12.243979Z")!,
    timezone: "America/Los_Angeles",
    email: "test@gmail.com")
