//
//  NetworkManager.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    func fetchJson<T>(from url: URL, completionHandler: @escaping ((T)?, URLResponse?, Error?) -> Void) where T : Decodable
}

class NetworkManager: NetworkManagerProtocol {
    
    func fetchData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard isConnectedToTheInternet() else {
            let connectionError = NSError(domain: "", code: 503, userInfo: ["Service Unavailable":""])
            completionHandler(nil, nil, connectionError)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data else {
                completionHandler(nil, urlResponse, error)
                return
            }
            completionHandler(data, urlResponse, nil)
        }
        task.resume()
    }
    
    func fetchJson<T>(from url: URL, completionHandler: @escaping ((T)?, URLResponse?, Error?) -> Void) where T : Decodable {
        fetchData(from: url) { data, urlResponse, error in
            guard let data = data else {
                completionHandler(nil, urlResponse, error)
                return
            }
            let dataObject = try! JSONDecoder().decode(T.self, from: data)
            completionHandler(dataObject, urlResponse, nil)
        }
    }
    
    private func isConnectedToTheInternet() -> Bool {
        guard let reachable = NetworkReachabilityManager()?.isReachable else {
            return false
        }
        return reachable
    }
    
}
