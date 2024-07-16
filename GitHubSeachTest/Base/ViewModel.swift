//
//  ViewModel.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation
import Combine

open class BaseViewModel<State: ViewModelState>: ObservableObject {

    @Published private(set) var state: State

    var cancellables = Set<AnyCancellable>()

    func start() {
       fatalError("method 'start' should be overrided")
    }
    
    private func updateState(newValue: State) {
        state = newValue
    }
    
    init(state: State) {
        self.state = state
    }

    deinit {
        cancel()
    }

    private func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
