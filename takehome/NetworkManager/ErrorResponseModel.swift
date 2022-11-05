//
//  ErrorResponseModel.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 05.11.2022.
//

import Foundation

struct ErrorResponseModel: Decodable {
    private let title: String
    private let message: String
    
    var description: String {
         "\n 🚨\n \n Error title: \(title);\n Message: \(message)"
    }
}
