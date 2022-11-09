//
//  JSONDecoder+DefaultDecoder.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

extension JSONDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(Date.iso8601FractionalSecondsFormatter)

        return decoder
    }()
}
