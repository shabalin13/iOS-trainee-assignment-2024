//
//  Item.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

import Foundation

struct Item {
    
    let wrapperType: String?
    let kind: String?
    
    let artistId: Int?
    let artistName: String?
    let artistViewURL: URL?
    
    //    let collectionId: Int?
    //    let collectionName: String?
    //    let collectionViewURL: URL?
    
    let trackId: Int?
    let trackName: String?
    let trackViewURL: URL?
    
    let artworkURL: URL?
    
    let primaryGenreName: String?
    //    let country: String?
    
    let trackExplicitness: Bool?
    //    let collectionExplicitness: String?
    
    let releaseDate: Date?
    
    let trackTime: Int?
    
    let userRatingCount: Int?
    let averageUserRating: Double?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistId, artistName, artistViewURL = "artistViewUrl"
        //        case collectionId, collectionName, collectionViewURL = "collectionViewUrl"
        case trackId, trackName, trackViewURL = "trackViewUrl"
        case artworkURL = "artworkUrl100"
        case primaryGenreName /*, country*/
        case trackExplicitness /*, collectionExplicitness*/
        case releaseDate
        case trackTime = "trackTimeMillis"
        case userRatingCount, averageUserRating
    }
    
}

extension Item: Decodable {
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        wrapperType = try container.decodeIfPresent(String.self, forKey: .wrapperType)
        kind = try container.decodeIfPresent(String.self, forKey: .kind)
        artistId = try container.decodeIfPresent(Int.self, forKey: .artistId)
        artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        artistViewURL = try container.decodeIfPresent(URL.self, forKey: .artistViewURL)
        trackId = try container.decodeIfPresent(Int.self, forKey: .trackId)
        trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        trackViewURL = try container.decodeIfPresent(URL.self, forKey: .trackViewURL)
        artworkURL = try container.decodeIfPresent(URL.self, forKey: .artworkURL)
        primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName)
        
        if let explicitnessString = try container.decodeIfPresent(String.self, forKey: .trackExplicitness) {
            trackExplicitness = explicitnessString != "notExplicit"
        } else {
            trackExplicitness = nil
        }
        
        let dateString = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        if let dateString = dateString {
            let dateFormatter = ISO8601DateFormatter()
            dateFormatter.formatOptions = [.withInternetDateTime]
            releaseDate = dateFormatter.date(from: dateString)
        } else {
            releaseDate = nil
        }

        trackTime = try container.decodeIfPresent(Int.self, forKey: .trackTime)

        userRatingCount = try container.decodeIfPresent(Int.self, forKey: .userRatingCount)
        averageUserRating = try container.decodeIfPresent(Double.self, forKey: .averageUserRating)
                
    }
}
