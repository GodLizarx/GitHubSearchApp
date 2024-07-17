//
//  SearchDetailView.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

struct SearchDetailView: View {
    
    @StateObject private var viewModel: SearchDetailViewModel
    
    init(viewModel: SearchDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        viewModel.start()
    }
    
    var body: some View {
        VStack(spacing: 24) {
            topView
            sectionBlock
    
        }
    }
    
    var topView: some View {
        
            VStack(spacing: 16) {
                NavBarView(
                    title: viewModel.model.language ?? .empty,
                    linkString: viewModel.model.htmlURL ,
                    backActionState: $viewModel.isBackButtonTriggered
                )
                
                Image(systemName: "text.book.closed")
                    .symbolRenderingMode(.monochrome)
                    .foregroundColor(Color.white)
                    .font(.system(size: 40, weight: .regular))
                
                Text(viewModel.model.name)
                    .foregroundStyle(.white)
                    .font(.title2)
                
                Text(viewModel.model.description ?? .empty)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding(.horizontal)
                
                counterBlock
            }
            .padding(.bottom, 16)
            .background(.black)
            
    }
    
    var counterBlock: some View {
        HStack(spacing: 60){
            VStack {
                Text(viewModel.model.stargazersCount.formattedNumber())
                Text("Stars")
            }
            .font(.headline)
            .foregroundStyle(.white)
            
            VStack {
                Text(viewModel.model.watchersCount.formattedNumber())
                Text("Watchers")
            }
            .font(.headline)
            .foregroundStyle(.white)
        }
    }
    
    var sectionBlock: some View {
        VStack(spacing: 8) {
            DetailSectionItem(
                header: "AUTHOR",
                value: viewModel.model.owner.login,
                urlString: viewModel.model.owner.avatarURL
            )
            
            DetailSectionItem(
                header: .empty,
                value: "\(viewModel.model.forkCount) Forks",
                sysName: "arrow.triangle.branch"
            )
            
            DetailSectionItem(
                header: .empty,
                value: "\(viewModel.model.openIssueCount) Issues",
                sysName: "exclamationmark.circle"
            )
        
            Spacer()
        }
    }
    
}

#Preview {
    SearchDetailView(
        viewModel: SearchDetailViewModel(
            coordinator: AppCoordinator(navigationController: UINavigationController()),
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
                stargazersCount: 15000,
                watchersCount: 25000,
                language: "Swift",
                forkCount: 281, 
                openIssueCount: 75
            )
        )
    )
}
