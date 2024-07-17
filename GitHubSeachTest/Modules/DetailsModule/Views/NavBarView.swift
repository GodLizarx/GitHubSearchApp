//
//  NavBarView.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

struct NavBarView: View {
    @State private var title: String
    @State private var linkString: String
    @Binding private var backActionState: Bool
    
    private var url: URL? {
        URL(string: linkString)
    }
    
    init(
        title: String,
        linkString: String,
        backActionState: Binding<Bool>
    ) {
        self.title = title
        self.linkString = linkString
        self._backActionState = backActionState
    }
    
    var body: some View {
        HStack {
            Button(action: {
                backActionState = true
            }, label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 24)
            })

            Spacer()
            
            Label(title: {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.title2)
                },
                icon: {
                Circle()
                    .fill(with: title)
                    .frame(width: 20)
            }).offset(.init(width: -16, height: .zero))
            
            Spacer()
            
            if let url {
                Link(destination: url, label: {
                    Image(systemName: "safari")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 24, height: 24)
                })
            }
        }
        .padding()
        .frame(height: 40)
        .background(.black)
    }
}

#Preview {
    NavBarView(
        title: "Swift",
        linkString: "123",
        backActionState: Binding(projectedValue: .constant(false))
    )
}
