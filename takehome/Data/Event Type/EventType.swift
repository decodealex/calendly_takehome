//
//  EventType.swift
//  takehome
//
//

import Foundation

struct EventType: Decodable, Equatable {
    let name: String
    let color: String
    let duration: Int
    let schedulingUrl: String
    let uri: String
    let active: Bool
    let kind: EventKind
}

struct EventTypesPayload: Decodable {
    let collection: [EventType]
    let pagination: Pagination
}

enum EventKind: String, Decodable {
    case solo
    case group
}

extension EventKind {
    var title: String {
        switch self {
        case .solo: return "ONE-ON-ONE"
        case .group: return "GROUP MEETING"
        }
    }
}
