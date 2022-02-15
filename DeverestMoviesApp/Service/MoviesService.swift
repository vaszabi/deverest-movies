//
//  MoviesService.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation

class MoviesService {
    
    var networkManager = NetworkManager()
    
    func fetchMovieList(with keyword: String, completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        let url = buildRequestURL(with: keyword)
        
        networkManager.loadData(from: url) { (fetchedMovieResult: MovieListResult?, urlResponse, error) in
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
    
    
    
    private func buildRequestURL(with keyword: String) -> URL {
        //TODO: Remove optional force unwrap
        var urlComps = URLComponents(string: Configuration.baseURL + Configuration.searchUrl)!
        let queryItems = [URLQueryItem(name: "query", value: keyword),
                          URLQueryItem(name: "api_key", value: Configuration.apiKey)]
        urlComps.queryItems = queryItems
        
        return urlComps.url!
    }
}
