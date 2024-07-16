//
//  APIClient.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

open class APIClient<T: API> {
    var networkManager: NetworkManager {
        return NetworkService.shared
    }
    
    func request<U: Decodable>(_ service: T) async throws -> U {
        return try await networkManager.request(service)
    }
}
