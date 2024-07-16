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
    }

    var body: some View {
        headerView
        searchList
        Text("Hello world")
    }
    
    var headerView: some View {
        EmptyView()
    }
    
    @ViewBuilder
    var searchList: some View {
        EmptyView()
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel(state: .idle))
}
