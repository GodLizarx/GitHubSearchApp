//
//  SearchDetailCoordinator.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import UIKit
import SwiftUI

class SearchDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator] = []
    private let model: SearchItemResponse
    
    init(
        navigationController: UINavigationController,
        parentCoordinator: Coordinator,
        model: SearchItemResponse
    ) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.model = model
    }
    
    func start() {
        let viewModel = SearchDetailViewModel(coordinator: self, model: model)
        let view = SearchDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
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
