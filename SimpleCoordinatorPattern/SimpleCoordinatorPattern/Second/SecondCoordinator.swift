//
//  SecondCoordinator.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

@MainActor
final class SecondCoordinator: ObservableObject, Identifiable {
    
    @Published var isTabbarHidden: Bool
    @Published var viewModel: SecondViewModel!
    
    private unowned let parent: MainCoordinator?
    
    init(parent: MainCoordinator?, isTabbarHidden: Bool, willChangeTabTo: MainTab) {
        self.parent = parent
        self.isTabbarHidden = isTabbarHidden
        self.viewModel = SecondViewModel(coordinator: self, willChangeTabTo: willChangeTabTo)
    }
    
    func changeTab(with tab: MainTab) {
        parent?.tab = tab
    }
}

