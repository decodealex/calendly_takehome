//
//  Account.swift
//  takehome
//
//

import Foundation

struct Account: Decodable {
    let uri: String
    let name: String
    let avatarUrl: String?
    let schedulingUrl: String
}

struct AccountPayload: Decodable {
    let resource: Account
}
