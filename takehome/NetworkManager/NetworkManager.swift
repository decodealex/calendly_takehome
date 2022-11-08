//
//  NetworkManager.swift
//  takehome
//

import Foundation

protocol NetworkManagerProtocol {
    func setAccessToken(_ accessToken: String)
    func get(_ url: String) async throws -> Data
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private var accessToken: String?
}

extension NetworkManager: NetworkManagerProtocol {
    
    func setAccessToken(_ newAccessToken: String) {
        accessToken = newAccessToken
    }
    
    func get(_ url: String) async throws -> Data {
        guard let accessToken = accessToken else { throw APIError.generic(message: "Missing Access Token") }
        guard let url = URL(string: url) else { throw APIError.generic(message: "URL could not be created") }

        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "Bearer \(accessToken)"]
        
        let session = URLSession(configuration: config)
        let (data, response) = try await session.data(from: url)
        
        Logger.log(.debug, message: "NetworkManager received data: \(String(data: data, encoding: .utf8))")
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            let error = try JSONDecoder().decode(ErrorResponseModel.self, from: data)
            Logger.log(.error, message: "NetworkManager received data: \(String(data: data, encoding: .utf8))")
            throw APIError.generic(message: error.description)
        }
        return data
    }
}

enum APIError: Error {
    case generic(message: String)
}
