//
//  NetworkError.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

public indirect enum NetworkError: LocalizedError {
    case noData
    case anotherError(String, Error)
    case badUrl
    case processableError(Error)
    case invalidResponse
    case wrongStatusCode(_ statusCode: Int)
    case noInternet
    case cancelled
}
