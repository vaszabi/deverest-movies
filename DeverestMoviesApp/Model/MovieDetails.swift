//
//  MovieDetails.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

struct MovieDetails: Codable {
    
    let isAdult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [MovieGenre]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [MovieProductionCompany]?
    let productionCountries: [MovieProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [MovieSpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let isVideo: Bool?
    let voteAverage: Float?
    let voteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        
        case isAdult = "adult"
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case isVideo = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
    
}

struct MovieGenre: Codable {
    let id: Int?
    let name: String?
}

struct MovieProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct MovieProductionCountry: Codable {
    let iso31661: String?
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name
    }
}

struct MovieSpokenLanguage: Codable {
    let iso6391: String?
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case name
    }
}
