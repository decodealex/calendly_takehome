//
//  Account.swift
//  takehome
//
//

import Foundation

struct Account: Decodable {
    let uri: String
}

struct AccountPayload: Decodable {
    let resource: Account
}
