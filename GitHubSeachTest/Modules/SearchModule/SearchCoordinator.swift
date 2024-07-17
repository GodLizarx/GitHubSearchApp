//
//  SearchCoordinator.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import Foundation
import SwiftUI

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator] = []
    
    init(
        navigationController: UINavigationController,
        parentCoordinator: Coordinator
    ) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let viewModel = SearchViewModel(coordinator: self)
        let view = SearchView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func openDetiled(_ model: SearchItemResponse) {
        
        let detailedCoordinator = SearchDetailCoordinator(
            navigationController: navigationController,
            parentCoordinator: self,
            model: model
        )
        self.parentCoordinator.childCoordinators.append(detailedCoordinator)
        detailedCoordinator.start()
    }
    
    func back() {
        navigationController.popViewController(animated: true)
        parentCoordinator.childDidFinish(self)
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
