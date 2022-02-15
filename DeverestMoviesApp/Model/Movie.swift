//
//  Movie.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

struct Movie : Codable {
    
    let isAdult: Bool
    let posterPath: String?
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let isVideo: Bool
    let voteAverage: Float
    
    private enum CodingKeys: String, CodingKey {
        case isAdult = "adult"
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case isVideo = "video"
        case voteAverage = "vote_average"
    }
    
}
