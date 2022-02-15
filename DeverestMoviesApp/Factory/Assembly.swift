//
//  Assembly.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import Swinject

class NetworkManagerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NetworkManagerProtocol.self) { _ in
            return NetworkManager()
        }
    }
}

class MoviesServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MoviesServiceProtocol.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagerProtocol.self)
            let moviesService = MoviesService()
            moviesService.networkManager = networkManager
            return moviesService
        }
    }
}

class HomePresenterAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(HomePresenter.self) { resolver in
            let moviesService = resolver.resolve(MoviesServiceProtocol.self)
            let homePresenter = HomePresenter()
            homePresenter.service = moviesService
            return homePresenter
        }
    }
}

class HomeViewAssembly: Assembly {
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(HomeViewController.self) { resolver, viewController in
            let presenter = resolver.resolve(HomePresenter.self)
            viewController.presenter = presenter
        }
       
    }
    
}
