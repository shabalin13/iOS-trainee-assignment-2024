//
//  ItemMediaType.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

enum ItemMediaType {
    
    case movie(MovieEntity)
    case podcast(PodcastEntity)
    case music(MusicEntity)
    case musicVideo(MusicVideoEntity)
    case audiobook(AudiobookEntity)
    case shortFilm(ShortFilmEntity)
    case tvShow(TVShowEntity)
    case software(SoftwareEntity)
    case ebook(EbookEntity)
    case all(AllEntity)
    
    var toString: String {
        switch self {
        case .movie:
            return "movie"
        case .podcast:
            return "podcast"
        case .music:
            return "music"
        case .musicVideo:
            return "musicVideo"
        case .audiobook:
            return "audiobook"
        case .shortFilm:
            return "shortFilm"
        case .tvShow:
            return "tvShow"
        case .software:
            return "software"
        case .ebook:
            return "ebook"
        case .all:
            return "all"
        }
    }
    
    var entity: String? {
        switch self {
        case .movie(let movieEntity):
            return movieEntity == .defaultEntity ? nil : movieEntity.rawValue
        case .podcast(let podcastEntity):
            return podcastEntity == .defaultEntity ? nil : podcastEntity.rawValue
        case .music(let musicEntity):
            return musicEntity == .defaultEntity ? nil : musicEntity.rawValue
        case .musicVideo(let musicVideoEntity):
            return musicVideoEntity == .defaultEntity ? nil : musicVideoEntity.rawValue
        case .audiobook(let audiobookEntity):
            return audiobookEntity == .defaultEntity ? nil : audiobookEntity.rawValue
        case .shortFilm(let shortFilmEntity):
            return shortFilmEntity == .defaultEntity ? nil : shortFilmEntity.rawValue
        case .tvShow(let tVShowEntity):
            return tVShowEntity == .defaultEntity ? nil : tVShowEntity.rawValue
        case .software(let softwareEntity):
            return softwareEntity == .defaultEntity ? nil : softwareEntity.rawValue
        case .ebook(let ebookEntity):
            return ebookEntity == .defaultEntity ? nil : ebookEntity.rawValue
        case .all(let allEntity):
            return allEntity == .defaultEntity ? nil : allEntity.rawValue
        }
    }
    
}
