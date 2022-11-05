//
//  EventType.swift
//  takehome
//
//

import Foundation

struct EventType: Decodable {
    let name: String
    let color: String
}

struct EventTypesPayload: Decodable {
    let collection: [EventType]
}
