//
//  AccountRemoteDataSource.swift
//  takehome
//
//

import Foundation
import CalendlyNetworkService

protocol AccountRemoteDataSourceProtocol {
    func getAccount() async throws -> Account
}

struct AccountRemoteDataSource {
    private let networkManager: NetworkManagerProtocol
    private let decoder: JSONDecoder
    
    init(_ networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Date.iso8601FractionalSecondsFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}

extension AccountRemoteDataSource: AccountRemoteDataSourceProtocol {
    func getAccount() async throws -> Account {
        let data = try await networkManager.request(urlSession: .shared, endpoint: UsersEndpoint.getCurrentUser)
        let accountPayload = try decoder.decode(AccountPayload.self, from: data)
        return accountPayload.resource
    }
}
