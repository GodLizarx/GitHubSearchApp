//
//  SearchAPIClient.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Combine

protocol SearchAPIClient {
    func searchQuery(_ query: String, _ page: Int) async throws -> SearchResponse
}

final class SearchAPIClientImpl: APIClient<SearchAPI> {}

extension SearchAPIClientImpl: SearchAPIClient {
    func searchQuery(_ query: String, _ page: Int) async throws -> SearchResponse {
        try await request(.search(query, page))
    }
}
