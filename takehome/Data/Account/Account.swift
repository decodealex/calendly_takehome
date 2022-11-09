//
//  Account.swift
//  takehome
//
//

import Foundation

struct Account: Decodable, Equatable {
    let uri: String
    let name: String
    let avatarUrl: String?
    let schedulingUrl: String
    let createdAt: Date
    let updatedAt: Date
    let timezone: String
    let email: String
}

struct AccountPayload: Decodable {
    let resource: Account
}
