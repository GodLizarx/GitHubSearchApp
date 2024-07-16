//
//  SearchViewModel.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

enum SearchViewModelState: ViewModelState {
    case idle
    case loading
    case started
    case failed
}

final class SearchViewModel: BaseViewModel<SearchViewModelState> {
    
    override func start() {
        
    }
}


