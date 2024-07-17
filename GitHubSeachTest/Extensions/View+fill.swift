//
//  View+fill.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

extension View {
    func fill(with languageColor: String) -> some View {
        if let hex = LanguageColorService.shared.provideColorHex(for: languageColor) {
            return self.foregroundColor(Color(hexString: hex) )
        } else {
            return self.foregroundColor(.black)
        }
    }
}
