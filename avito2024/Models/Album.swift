//
//  Album.swift
//  avito2024
//
//  Created by DIMbI4 on 14.04.2024.
//

import Foundation

struct Album: Decodable {
    
    let artistName: String?
    let collectionName: String?
    let artworkURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case artistName, collectionName, artworkURL = "artworkUrl100"
    }
    
}
