//
//  SearchViewModel.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Combine
import SwiftUI

enum SearchViewModelState: ViewModelState {    
    case idle
    case loading
    case started
    case failed
}

final class SearchViewModel: BaseViewModel<SearchViewModelState> {

    //MARK: - Published properties
    
    @Published var query: String = .empty
    @Published var repositoryItems: [SearchItemResponse] = []
    @Published var hasToMoreItemsToLoad: Bool = false
    @Published var limitExceededResponse: ErrorResponse?
    @Published var shoudlShowAlert: Bool = false
    
    // MARK: - Private properties
    
    private unowned let coordinator: SearchCoordinator
    
    private var isFetchingMore: Bool = false
    private var task: Task<Void, Error>?
    private let apiClient: SearchAPIClient
    
    private let debounceInterval: TimeInterval = 1
    
    private var totalRepositoryCount = 0
    private let itemsPerPage = 30 /// Provided default value in docs
    private var nextPageIndex: Int {
        guard repositoryItems.count > .zero else { return 1 }
        return repositoryItems.count / itemsPerPage + 1
    }
    
    // MARK: - Lifecycle
    
    init(
        coordinator: SearchCoordinator,
        apiClient: SearchAPIClient = SearchAPIClientImpl()
    ) {
        self.apiClient = apiClient
        self.coordinator = coordinator
        super.init(state: .idle)
    }
    
    override func start() {
        $query
            .debounce(for: .seconds(debounceInterval), scheduler: DispatchQueue.main)
            .filter { $0.count >= 3 || $0.isEmpty }
            .removeDuplicates()
            .sink
        { newValue in
            self.repositoryItems = []
            self.totalRepositoryCount = .zero
            self.hasToMoreItemsToLoad = false
            if newValue.isEmpty {
                self.updateState(newValue: .idle)
                self.task?.cancel()
                return
            }
            
            self.updateState(newValue: .loading)
            print("SET LOADING")
            self.updateRepositoryList()
        }
        .store(in: &cancellables)
    }
    
    func fetchMoreRepositories() {
        if isFetchingMore { return }
        isFetchingMore.toggle()
        updateRepositoryList(page: nextPageIndex)
    }
    
    func openDetailed(model: SearchItemResponse) {
        coordinator.openDetiled(model)
    }
}

// MARK: - Private extension

private extension SearchViewModel {
    func updateRepositoryList(page: Int = 1) {
        task?.cancel()
        task = Task { @MainActor [weak self] in
            try Task.checkCancellation()
            guard let self else { return }
            do {
                let response = try await self.apiClient.searchQuery(self.query, page)
                try Task.checkCancellation()
                self.handleResponse(response)
            } catch NetworkError.requestLimitExceeded(let response) {
                self.isFetchingMore = false
                self.query = .empty
                self.limitExceededResponse = response
                self.shoudlShowAlert = true
                self.updateState(newValue: .started)
            } catch let error {
                if Task.isCancelled {
                    print("SET CANCELD")
                    isFetchingMore = false
                    self.hasToMoreItemsToLoad = false
                    self.updateState(newValue: query.count < 3  ? .idle : .loading )
                } else {
                    print("SET FAILED")
                    isFetchingMore = false
                    self.hasToMoreItemsToLoad = false
                    self.updateState(newValue: .failed)
                }
                print(error)
            }
        }
    }
    
    func handleResponse(_ response: SearchResponse) {
        print("SET LOADED")
        repositoryItems += response.items
        totalRepositoryCount = response.totalCount
        hasToMoreItemsToLoad = totalRepositoryCount > repositoryItems.count
        isFetchingMore = false
        updateState(newValue: .started)
    }
}


