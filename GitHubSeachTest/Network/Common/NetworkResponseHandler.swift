//
//  NetworkResponseHandler.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

public class NetworkResponseHandler {
    
    private let decoder = JSONDecoder()
    
    func parse<T: Decodable>(from jsonObject: Data) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: jsonObject)
            return decodedData
        } catch {
            do {
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: jsonObject)
                throw NetworkError.requestLimitExceeded(response: errorResponse)
            } catch {
                throw error
            }
        }
    }
    
    func log( error: Error?) {
        if let error = error {
            print("Error description: \(error.localizedDescription)")
        }
    }
    
    func log(response: HTTPURLResponse?, responseData: Data?) {
        if let response = response {
            print("RESPONSE: \(response.url?.absoluteString ?? "")")
            print("HEADERS: \(response.allHeaderFields as? [String: String] ?? [:])")
            print("HTTP status code: \(response.statusCode)")
        }
        
        if let responseData = responseData,
           let value = try? JSONSerialization.jsonObject(with: responseData),
           let rawData = try? JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted]),
           let jsonString = String(data: rawData, encoding: String.Encoding.utf8) {
            print("Response data: \(jsonString)")
        }
    }
}
