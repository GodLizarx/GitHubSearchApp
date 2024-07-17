//
//  SearchDetailViewModel.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 17.07.2024.
//

import SwiftUI

enum SearchDetailViewModelState: ViewModelState {
    case idle
    case started
}

final class SearchDetailViewModel: BaseViewModel<SearchDetailViewModelState> {
    
    // TODO: - should be replaced with custom Model that independed form backend
    @Published var isBackButtonTriggered: Bool = false {
        didSet {
            coordinator.back()
        }
    }
    @Published var model: SearchItemResponse
    
    private unowned let coordinator: Coordinator
    
    init(
        coordinator: Coordinator,
        model: SearchItemResponse
    ) {
        self.model = model
        self.coordinator = coordinator
        super.init(state: .idle)
    }
    
    override func start() {
        updateState(newValue: .started)
    }
    
    func close() {
        coordinator.back()
    }
}
