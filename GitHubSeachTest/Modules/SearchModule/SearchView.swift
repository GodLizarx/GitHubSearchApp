//
//  SearchView.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        viewModel.start()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                listView
                    .alert(
                        isPresented: $viewModel.shoudlShowAlert,
                        content: {
                            Alert(
                                title: Text(Constants.alertTitle),
                                message: Text(viewModel.limitExceededResponse?.message ?? .empty),
                                dismissButton: .cancel(Text("Ok"))
                            )
                        })
                
                switch viewModel.state {
                case .idle, .failed:
                    Image("GitHubLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                case .loading, .started:
                    // should do nothing
                    EmptyView()
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var listView: some View {
        List {
            switch viewModel.state {
            case .loading:
                ForEach(0..<10) { _ in
                    SkeletonRow()
                }
            case .failed:
                EmptyView()
            default:
                ForEach(viewModel.repositoryItems, id: \.id) { item in
                    ZStack {
                        RepositoryCellView(model: item)
                            .onTapGesture {
                                viewModel.openDetailed(model: item)
                            }
                    }
                }
                
                if viewModel.hasToMoreItemsToLoad {
                    SkeletonRow()
                        .onAppear() {
                            viewModel.fetchMoreRepositories()
                        }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(Constants.title)
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $viewModel.query, prompt: Constants.placeholder)
    }
}

fileprivate enum Constants {
    static let title = "Repositories"
    static let placeholder = "Search repositories"
    static let alertTitle = "Limit exceeded"
}

#Preview {
    SearchView(
        viewModel: SearchViewModel(
            coordinator: SearchCoordinator(
                navigationController: UINavigationController(), parentCoordinator: AppCoordinator(navigationController: UINavigationController())
            )
        )
    )
}
