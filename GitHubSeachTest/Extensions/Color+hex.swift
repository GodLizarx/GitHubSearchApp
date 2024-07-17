//
//  Color+hex.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        self.init(
            red: Double(int >> 16) / 255,
            green: Double(int >> 8 & 0xFF) / 255,
            blue: Double(int & 0xFF) / 255
        )
    }
}
