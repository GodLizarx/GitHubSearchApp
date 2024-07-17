//
//  IconedLabel.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import SwiftUI

struct IconedLabel<Title: View, Icon: View>: View {
    
    private var title: Title
    private var icon: Icon
    
    init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder icon: () -> Icon
    ) {
        self.title = title()
        self.icon = icon()
    }
    
    var body: some View {
        HStack {
            title
            icon
        }
    }
}

#Preview {
    IconedLabel(title: {
        Text("Hi")
    }, icon: {
        Image(systemName: "star.fill")
    })
}
