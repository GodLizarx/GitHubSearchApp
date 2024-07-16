//
//  NetworkLayer.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

protocol NetworkManager {
    func request<T: Decodable>(_ model: API) async throws -> T
}

final class NetworkService {
    static let shared = NetworkService()
    private let responseHandler = NetworkResponseHandler()
}

extension NetworkService: NetworkManager {
    func request<T: Decodable>(_ model: API) async throws -> T {
        if Task.isCancelled { throw NetworkError.cancelled }
        let urlRequest = try model.asURLRequest()
        do {
            let data = try await URLSession.shared.data(for: urlRequest)
            responseHandler.log(
                response: data.1 as? HTTPURLResponse,
                responseData: data.0
            )
            return try responseHandler.parse(from: data.0)
        } catch let error {
            responseHandler.log(error: error)
            throw error
        }
    }
}
