//
//  MediaType.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

enum MediaType: String, CaseIterable {
    
    case music
    case movie
    case ebook
    
    var entity: String {
        switch self {
        case .music:
            return "song"
        case .movie:
            return "movie"
        case .ebook:
            return "ebook"
        }
    }
    
}
