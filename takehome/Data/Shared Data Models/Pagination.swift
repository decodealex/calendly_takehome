//
//  Pagination.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

struct Pagination: Decodable {
    let count: Int
    let nextPage: String?
    let previousPage: String?
    let nextPageToken: String?
    let previousPageToken: String?
}
