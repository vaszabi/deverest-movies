//
//  HomePresenter.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

class HomePresenter {
    
    var view: HomeViewController!
    private let service = MoviesService()
    
    func getMovies(with keyword: String = "father") {
        // Loading...
        
        DispatchQueue.main.async {
            // Fetch movies...
            self.service.fetchMovieList(with: keyword) { movies, error in
                guard let movies = movies else {
                    print("Fetching failed")
                    return
                }
                // Show result
                print(movies)
            }
        }
    }
}
