//
//  MockNetworkService.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import XCTest
@testable import takehome
@testable import CalendlyNetworkService

final class MockNetworkService: CalendlyNetworkService.NetworkManagerProtocol {
    
    var data: Data?
    
    func setAccessToken(_ accessToken: String) { }
    
    func request(urlSession: URLSession, endpoint: CalendlyNetworkService.Endpoint) async throws -> Data {
        guard let data = data else {
            throw TestError.generic(message: "Data is nil")
        }
        return data
    }
    
}
