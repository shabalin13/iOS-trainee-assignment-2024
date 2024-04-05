//
//  Item.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

struct Item: Decodable {
    
    let wrapperType: String?
    let kind: String?
    
    let artistId: Int?
    let artistName: String?
    let artistViewUrl: String?
    
    let collectionId: Int?
    let collectionName: String?
    let collectionViewUrl: String?
    
    let trackId: Int?
    let trackName: String?
    let trackViewUrl: String?
    
    let artworkUrl: String?
    
    let country: String?
    
    let primaryGenreName: String?
    
    let collectionExplicitness: String?
    let trackExplicitness: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistId, artistName, artistViewUrl
        case collectionId, collectionName, collectionViewUrl
        case trackId, trackName, trackViewUrl
        case artworkUrl = "artworkUrl100"
        case country, primaryGenreName
        case collectionExplicitness, trackExplicitness
    }
    
}
