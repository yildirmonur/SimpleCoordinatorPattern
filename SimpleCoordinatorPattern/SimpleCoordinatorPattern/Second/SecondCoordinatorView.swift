//
//  SecondCoordinatorView.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

struct SecondCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: SecondCoordinator
    
    // MARK: Views
    
    var body: some View {
        SecondView(viewModel: coordinator.viewModel)
            .if(coordinator.isTabbarHidden) { view in
                view.toolbar(.hidden, for: .tabBar)
            }
            .if(!coordinator.isTabbarHidden) { view in
                view.toolbar(.visible, for: .tabBar)
            }
            .onDisappear {
                coordinator.isTabbarHidden = false
            }
            .animation(.spring(), value: coordinator.isTabbarHidden)
    }
}

