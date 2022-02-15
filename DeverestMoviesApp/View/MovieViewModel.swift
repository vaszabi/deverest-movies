//
//  MovieViewModel.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import UIKit

struct MovieViewModel {
    
    let title: String
    let posterPath: String?
    let id: Int
    
    init(movie: Movie) {
        self.title = movie.originalTitle
        self.posterPath = movie.posterPath
        self.id = movie.id
    }
    
    func getBudget(completionHandler: @escaping (Int) -> Void) {
        MoviesService.shared.fetchMovieDetails(movieId: id) { details, error in
            guard let details = details else { return }
            completionHandler(details.budget ?? -1)
        }
    }
    
    func getPosterImg(completionHandler: @escaping (UIImage?) -> Void) {
        //TODO: Implement img fetch
        guard let path = self.posterPath else { return }
        MoviesService.shared.fetchPosterImg(path: path) { data, error in
            guard let data = data else { return }
            completionHandler(UIImage(data: data))
        }
    }
}
