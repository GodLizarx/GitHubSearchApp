//
//  RepositoryCellView.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import SwiftUI

struct RepositoryCellView: View {
    
    @State private var model: SearchItemResponse
    init(model: SearchItemResponse) {
        self.model = model
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            topView
            Text(model.description ?? "--")
                .font(.body)
        }
        .padding(.all, 8)
    }
    
    var topView: some View {
        HStack(spacing: 8) {
            Text(model.name)
                .font(.headline)
            Spacer()
            ratingBlock
                .fixedSize(horizontal: true, vertical: true)
        }
    }
    
    
    var ratingBlock: some View {
        HStack(spacing: 16) {
            IconedLabel(title: {
                Text("\(model.watchersCount)")
                    .font(.footnote.monospacedDigit())
                    .bold()
            }, icon: {
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            })

            
            IconedLabel(title: {
                Text("\(model.stargazersCount)")
                    .font(.footnote.monospacedDigit())
                    .bold()
            }, icon: {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            })
        }
    }
}


#Preview {
    RepositoryCellView(
        model: SearchItemResponse(
            id: 103212871,
            nodeID: "MDEwOlJlcG9zaXRvcnkxMDMyMTI4NzE",
            name: "sfwbar",
            fullName: "vnxidev/sfw",
            owner: .init(
                login: "leliel12",
                id: 299010,
                nodeID: "MDQ6VXNlcjI5OTAxMA==",
                avatarURL: "https://api.github.com/users/leliel12/followers",
                gravatarID: "",
                url: "https://api.github.com/users/leliel12",
                receivedEventsURL: "https://api.github.com/users/MihailRomanov/received_events",
                type: .empty,
                htmlURL: .empty,
                followersURL: .empty,
                followingURL: .empty,
                gistsURL: .empty,
                starredURL: .empty,
                subscriptionsURL: .empty,
                organizationsURL: .empty,
                reposURL: .empty,
                eventsURL: .empty,
                siteAdmin: true
            ),
            itemPrivate: false,
            htmlURL: "https://github.com/LBCrion",
            description: "S* Floating Window Bar",
            url: "https://api.github.com/users/aishalih",
            createdAt: .empty,
            updatedAt: .empty,
            pushedAt: .empty,
            homepage: .empty,
            stargazersCount: 15,
            watchersCount: 25,
            language: "Swift",
            forkCount: 281,
            openIssueCount: 75
        )
    )
}
