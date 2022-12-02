//
//  FirstCoordinatorView.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

struct FirstCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: FirstCoordinator
    
    // MARK: Views
    
    var body: some View {
        NavigationView {
            FirstView(viewModel: coordinator.viewModel)
                .navigation(item: $coordinator.secondCoordinator) { coordinator in
                    SecondCoordinatorView(coordinator: coordinator)
                }
                .hideTabbar(shouldHideTabbar: false)
        }
        .alert(item: $coordinator.alertItem) {
            Alert(title: $0.title, message: $0.message, dismissButton: $0.dismissButton)
        }
    }
}
