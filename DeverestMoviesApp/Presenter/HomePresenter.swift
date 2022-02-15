//
//  HomePresenter.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewDelegate! { get set }
    func getMovies(with keyword: String)
}

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewDelegate!
    var service: MoviesServiceProtocol!
    
    func getMovies(with keyword: String) {
        view.showLoading()
        
        DispatchQueue.main.async {
            self.service.fetchMovieList(with: keyword) { movies, error in
                guard let movies = movies else {
                    print("Fetching failed")
                    return
                }
                let movieViewModel = movies.map { MovieViewModel(movie: $0) }
                
                DispatchQueue.main.async {
                    self.view.showResult(with: movieViewModel)
                }
            }
        }
    }
}
