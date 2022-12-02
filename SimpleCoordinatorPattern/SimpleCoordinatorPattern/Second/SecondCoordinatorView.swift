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
            .hideTabbar(shouldHideTabbar: coordinator.isTabbarHidden)
    }
}

