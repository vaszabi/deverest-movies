//
//  NetworkManager.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import Alamofire

class NetworkManager {
    
    func loadData<T>(from url: URL, completionHandler: @escaping ((T)?, URLResponse?, Error?) -> Void) where T : Decodable {
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

            let dataObject = try! JSONDecoder().decode(T.self, from: data)
            completionHandler(dataObject, urlResponse, nil)
        }
        task.resume()
    }
    
    private func isConnectedToTheInternet() -> Bool {
        guard let reachable = NetworkReachabilityManager()?.isReachable else {
            return false
        }
        return reachable
    }
    
}
