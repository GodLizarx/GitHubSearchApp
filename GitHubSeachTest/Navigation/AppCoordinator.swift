//
//  AppCoordinator.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstCoordinator = SearchCoordinator(
            navigationController: navigationController,
            parentCoordinator: self
        )
        childCoordinators.append(firstCoordinator)
        firstCoordinator.start()
    }
    
    func back() {
        // No-op: AppCoordinator is the root coordinator and can't go back
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

