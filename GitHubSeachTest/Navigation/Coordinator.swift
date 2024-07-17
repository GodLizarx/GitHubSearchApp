//
//  Coordinator.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
    func back()
    func childDidFinish(_ child: Coordinator?)
}

