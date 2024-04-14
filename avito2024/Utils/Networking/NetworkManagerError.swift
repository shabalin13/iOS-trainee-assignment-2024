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
            return "createURLFailed".localize
        case .statusCodeFailed:
            return "statusCodeFailed".localize
        case .requestFailed:
            return "requestFailed".localize
        case .getDataFailed:
            return "getDataFailed".localize
        case .noInternetConnection:
            return "noInternetConnection".localize
        }
    }
    
}
