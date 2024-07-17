//
//  NetworkError.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

public struct ErrorResponse: Decodable {
    let message: String
    let documentationUrl: String
    
    enum CodingKeys: String, CodingKey {
        case message
        case documentationUrl = "documentation_url"
    }
}

public indirect enum NetworkError: LocalizedError {
    case noData
    case anotherError(String, Error)
    case badUrl
    case processableError(Error)
    case invalidResponse
    case wrongStatusCode(_ statusCode: Int)
    case requestLimitExceeded(response: ErrorResponse)
    case noInternet
    case cancelled
}
