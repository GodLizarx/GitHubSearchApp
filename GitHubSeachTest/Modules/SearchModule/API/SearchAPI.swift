//
//  SearchAPI.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

enum SearchAPI {
    case search(_ query: String, _ page: Int)
}

extension SearchAPI: API {
    var method: HTTPMethod {
        .get
    }
    
    var path: String {
        "search/repositories"
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let query, let page):
            return [
                "q": query,
                "page": page
            ]
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
