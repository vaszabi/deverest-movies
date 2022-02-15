//
//  AppCoordinator.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import Foundation
import UIKit

class AppCoordinator {
    
    let window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = DependencyProvider.shared.makeHomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
