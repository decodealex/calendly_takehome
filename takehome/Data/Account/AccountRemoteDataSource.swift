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
    
    init(_ networkManager: NetworkManagerProtocol = NetworkManager.shared, decoder: JSONDecoder = .defaultDecoder) {
        self.networkManager = networkManager
        self.decoder = decoder
    }
}

extension AccountRemoteDataSource: AccountRemoteDataSourceProtocol {
    func getAccount() async throws -> Account {
        let data = try await networkManager.request(urlSession: .shared, endpoint: UsersEndpoint.getCurrentUser)
        let accountPayload = try decoder.decode(AccountPayload.self, from: data)
        return accountPayload.resource
    }
}
