//
//  GitHubSeachTestApp.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import SwiftUI

@main
struct GitHubSeachTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .ignoresSafeArea(edges: .all)
        }
    }
}

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.additionalSafeAreaInsets = .zero
        navigationController.setNavigationBarHidden(true, animated: false)
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator.start()
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}


