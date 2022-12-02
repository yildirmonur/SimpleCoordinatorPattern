//
//  FirstCoordinator.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

@MainActor
final class FirstCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: MainCoordinator?
    @Published var alertItem: AlertItem?
    @Published var viewModel: FirstViewModel!
    @Published var secondCoordinator: SecondCoordinator?
    
    init(parent: MainCoordinator?) {
        self.parent = parent
        self.viewModel = FirstViewModel(coordinator: self, searchService: TeamPlayerSearchService())
    }
    
    func openSecond() {
        secondCoordinator = SecondCoordinator(parent: parent, isTabbarHidden: true, willChangeTabTo: .second)
    }
}

