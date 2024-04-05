//
//  ItemEntities.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

enum MovieEntity: String {
    case movieArtist, movie, defaultEntity
}

enum PodcastEntity: String {
    case podcastAuthor, podcast, defaultEntity
}

enum MusicEntity: String {
    case musicArtist, musicTrack, album, musicVideo, mix, song, defaultEntity
}

enum MusicVideoEntity: String {
    case musicArtist, musicVideo, defaultEntity
}

enum AudiobookEntity: String {
    case audiobookAuthor, audiobook, defaultEntity
}

enum ShortFilmEntity: String {
    case shortFilmArtist, shortFilm, defaultEntity
}

enum TVShowEntity: String {
    case tvEpisode, tvSeason, defaultEntity
}

enum SoftwareEntity: String {
    case software, iPadSoftware, macSoftware, defaultEntity
}

enum EbookEntity: String {
    case ebook, defaultEntity
}

enum AllEntity: String {
    case movie, album, allArtist, podcast, musicVideo, mix, audiobook, tvSeason, allTrack, defaultEntity
}
