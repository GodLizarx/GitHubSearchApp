//
//  DetailSectionItem.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

struct DetailSectionItem: View {
   
    private var header: String
    private var value: String
    private var url: URL?
    private var sysName: String
    
    init(
        header: String,
        value: String,
        urlString: String = .empty,
        sysName: String = .empty
    ) {
        self.header = header
        self.value = value
        self.url = URL(string: urlString)
        self.sysName = sysName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !header.isEmpty {
                Text(header.uppercased())
                    .padding()
                    .font(.title3.bold())
            }
            
            Rectangle()
                .foregroundStyle(.gray)
                .frame(height: 2)
            
            Label(
                title: { 
                    Text(value)
                        .font(.subheadline)
                },
                icon: {
                    if let url {
                        AsyncImage(url: url) { image in
                            image
                                .image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                        }
                    } else if !sysName.isEmpty {
                        Image(systemName: sysName)
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 24, height: 24)
                    }
                }
            ).padding()
            
            Rectangle()
                .foregroundStyle(.gray)
                .frame(height: 2)
        }
    }
}

#Preview {
    DetailSectionItem(
        header: "Author",
        value: "Lizard",
        //urlString: "https://avatars.githubusercontent.com/u/42816656?v=4"
        sysName: "arrow.triangle.branch"
    )
}
