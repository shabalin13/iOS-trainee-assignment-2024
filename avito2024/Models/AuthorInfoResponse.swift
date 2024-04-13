//
//  AuthorInfoResponse.swift
//  avito2024
//
//  Created by DIMbI4 on 14.04.2024.
//

import Foundation

struct AuthorInfoResponse: Decodable {
    
    let resultCount: Int
    let results: [AuthorInfo]
    
    enum CodingKeys: String, CodingKey {
        case resultCount, results
    }
    
}
