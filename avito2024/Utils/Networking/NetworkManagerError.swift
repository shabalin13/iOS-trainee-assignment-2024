//
//  NetworkManagerError.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

import Foundation

enum NetworkManagerError: Error, LocalizedError {
    
    case createURLFailed
    case statusCodeFailed
    case requestFailed
    case getDataFailed
    case noInternetConnection
    
    var localizedDescription: String {
        switch self {
        case .createURLFailed:
            return NSLocalizedString("Failed to create URL", comment: "")
        case .statusCodeFailed:
            return NSLocalizedString("Got bad status code", comment: "")
        case .requestFailed:
            return NSLocalizedString("Request failed", comment: "")
        case .getDataFailed:
            return NSLocalizedString("Failed to get data", comment: "")
        case .noInternetConnection:
            return NSLocalizedString("No Internet connection", comment: "")
        }
    }
    
}
