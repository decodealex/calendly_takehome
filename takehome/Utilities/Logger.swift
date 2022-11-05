//
//  Logger.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 05.11.2022.
//

import Foundation

class Logger {
    
    static func log(_ type: LogType, message: String) {
        switch type {
        case .error: print("❌ ERROR: \(message) ")
        case .info: print("ℹ️ INFO: \(message) ")
        case .warning: print("⚠️ WARNING: \(message) ")
        case .debug: print("❗️DEBUG: \(message) ")
        }
    }
    
}

extension Logger {
    enum LogType {
        case error, info, warning, debug
    }
}
