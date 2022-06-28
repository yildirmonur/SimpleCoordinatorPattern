//
//  FirstViewModel.swift
//  SimpleCoordinatorPattern
//
//  Created by Yasemin Üçtaş on 28.06.2022.
//

import SwiftUI

class FirstViewModel: ObservableObject {
    
    unowned let coordinator: FirstCoordinator
    private let searchService: TeamPlayerSearchServiceProtocol
    
    init(coordinator: FirstCoordinator, searchService: TeamPlayerSearchServiceProtocol) {
        self.searchService = searchService
        self.coordinator = coordinator
        
        getSearchResults(with: "Ronaldo")
    }
    
    func getSearchResults(with text: String, searchType: TeamPlayerSearchRequest.SearchType = .all) {
        let request = TeamPlayerSearchRequest(searchString: text, searchType: searchType)
        
        Task {
            do {
                let result = try await searchService.search(with: request)
                
                // we get the result here
                print(result)
            }
            catch (let error) {
                print(error)
            }
        }
    }
    
    @MainActor
    func showAlert(error: CustomError) {
        coordinator.alertItem = error.showUrlAlert()
    }
    
}
