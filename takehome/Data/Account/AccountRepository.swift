//
//  AccountRepository.swift
//  takehome
//
//

import Foundation
import CalendlyNetworkService

protocol AccountRepositoryProtocol {
    mutating func getAccount() async throws -> Account
}

struct AccountRepository {
    private let dataSource: AccountRemoteDataSourceProtocol
    private var account: Account?
    
    init(_ dataSource: AccountRemoteDataSourceProtocol? = nil) {
        self.dataSource = dataSource ?? AccountRemoteDataSource()
    }
}

extension AccountRepository: AccountRepositoryProtocol {
    mutating func getAccount() async throws -> Account {
        guard let account = account else {
            account = try await dataSource.getAccount()
            if account == nil { throw NetworkError.generic(description: "Unknown error retrieving Account information.") }
            return account!
        }
        return account
    }
}
