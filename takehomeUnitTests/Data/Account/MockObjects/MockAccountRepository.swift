//
//  MockAccountRepository.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import takehome

struct MockAccountRepository: AccountRepositoryProtocol {
    func getAccount() async throws -> Account {
        return mockAccount
    }
}
