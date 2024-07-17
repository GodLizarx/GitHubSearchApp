//
//  Int+NumberFormatter.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import Foundation

extension Int {
    func formattedNumber() -> String {
        guard self >= 1000 else { return "\(self)" }
        let formattedNumber = Double(self) / 1000.0
        return String(format: "%.1fk", formattedNumber)
    }
}
