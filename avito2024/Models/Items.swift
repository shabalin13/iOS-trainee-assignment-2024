//
//  Items.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

struct Items: Decodable {
    
    let resultCount: Int
    let results: [Item]
    
    enum CodingKeys: String, CodingKey {
        case resultCount, results
    }
    
}
