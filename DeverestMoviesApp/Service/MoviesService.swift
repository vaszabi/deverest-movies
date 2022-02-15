//
//  MoviesService.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

protocol MoviesServiceProtocol {
    func fetchMovieList(with keyword: String, completionHandler: @escaping ([Movie]?, Error?) -> Void)
    func fetchPosterImg(path: String, completionHandler: @escaping (Data?, Error?) -> Void)
    func fetchMovieDetails(movieId: Int, completionHandler: @escaping (MovieDetails?, Error?) -> Void)
}

class MoviesService: MoviesServiceProtocol {
    
    var networkManager: NetworkManagerProtocol! = NetworkManager()
    
    static let shared = MoviesService()
    
    func fetchMovieList(with keyword: String, completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        let url = buildSearchRequestURL(with: keyword)
        
        networkManager.fetchJson(from: url) { (fetchedMovieResult: MovieListResult?, urlResponse, error) in
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            guard let movieResult = fetchedMovieResult else {
                completionHandler(nil, error)
                return
            }
            
            completionHandler(movieResult.results, nil)
        }
    }
    
    func fetchPosterImg(path: String, completionHandler: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: Configuration.imageURL + path) else { return }
        networkManager.fetchData(from: url) { data, response, error in
            guard let data = data,
                  error == nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(data, nil)
        }
    }
    
    func fetchMovieDetails(movieId: Int, completionHandler: @escaping (MovieDetails?, Error?) -> Void) {
        let url = buildDetailsRequestURL(movieId: movieId)
        networkManager.fetchJson(from: url) { (movieDetails: MovieDetails?, response, error) in
            guard let movieDetails = movieDetails,
            error == nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(movieDetails, nil)
        }
    }
    
    //MARK: Private methods
    private func buildDetailsRequestURL(movieId: Int) -> URL {
        var urlComps = URLComponents(string: Configuration.baseURL + Configuration.detailUrl + "\(movieId)")!
        let queryItems = [URLQueryItem(name: "api_key", value: Configuration.apiKey)]
        urlComps.queryItems = queryItems
        
        return urlComps.url!
    }
    
    private func buildSearchRequestURL(with keyword: String) -> URL {
        var urlComps = URLComponents(string: Configuration.baseURL + Configuration.searchUrl)!
        let queryItems = [URLQueryItem(name: "query", value: keyword),
                          URLQueryItem(name: "api_key", value: Configuration.apiKey)]
        urlComps.queryItems = queryItems
        
        return urlComps.url!
    }
}
