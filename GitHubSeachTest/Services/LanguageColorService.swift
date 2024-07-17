//
//  LanguageColorService.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import Foundation

struct LanguageColor: Decodable {
    let color: String?
    let url: String
}

final class LanguageColorService {
    static let shared = LanguageColorService()
    private var colorDictionary: [String: LanguageColor] = [:]
    
    init() {
        self.colorDictionary = self.loadJSON()
    }
    
    internal func provideColorHex(for key: String) -> String? {
        return colorDictionary[key]?.color
    }
    
    private func loadJSON() -> [String: LanguageColor] {
        guard let url = Bundle.main.url(forResource: "colors", withExtension: "json") else {
            print("Failed to locate JSON file.")
            return [:]
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([String: LanguageColor].self, from: data)
            return decodedData
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return [:]
        }
    }
}




