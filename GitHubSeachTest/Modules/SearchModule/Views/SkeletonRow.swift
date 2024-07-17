//
//  SkeletonRow.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import SwiftUI

struct SkeletonRow: View {
    
    private let gradient: Gradient = .init(colors: [
        .black.opacity(0.3),
        .black.opacity(0.4),
        .black.opacity(0.3)
    ])
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 150, height: 18)
                    .foregroundStyle(.gray)
                    .shimmering(gradient: gradient)
                    
                Spacer()
                
                HStack(spacing: 8) {
                    
                    ForEach(0..<2) { _ in
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 40, height: 18)
                            .foregroundStyle(.gray)
                            .shimmering(gradient: gradient)
                    }
                }
            }
            
            VStack {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 16)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .shimmering(gradient: gradient)
                }
            }
            
        }.padding(.all, 8)
    }
}

#Preview {
    SkeletonRow()
}
