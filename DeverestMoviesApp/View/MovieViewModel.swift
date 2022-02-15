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
        //TODO: Implement budget fetch
    }
    
    func getPosterImg(completionHandler: @escaping (UIImage) -> Void) {
        //TODO: Implement img fetch
    }
}
