//
//  AuthorInfo.swift
//  avito2024
//
//  Created by DIMbI4 on 13.04.2024.
//

import Foundation

struct AuthorInfo: Decodable {
    
    let authorName: String?
    let authorLinkURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case authorName = "artistName"
        case authorLinkURL = "artistLinkUrl"
    }
    
}
