//
//  Date+String.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
import takehome

extension Date {
    static func dateFrom(_ string: String) -> Date? {
        Date.iso8601FractionalSecondsFormatter.date(from: string)
    }
}
