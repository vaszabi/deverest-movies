//
//  DependencyProvider.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import Swinject
import SwinjectStoryboard

class DependencyProvider {
    
    static let shared = DependencyProvider()
    
    let container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler([
            NetworkManagerAssembly(),
            MoviesServiceAssembly(),
            HomePresenterAssembly(),
            HomeViewAssembly()
        ], container: container)
    }
    
    func makeHomeViewController() -> HomeViewController {
        let swinjectStoryboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
        return swinjectStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
}
