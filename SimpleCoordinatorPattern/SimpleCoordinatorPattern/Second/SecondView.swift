//
//  SecondView.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

@MainActor
class SecondViewModel: ObservableObject {
    
    private unowned let coordinator: SecondCoordinator
    private let willChangeTabTo: MainTab
    
    init(coordinator: SecondCoordinator, willChangeTabTo: MainTab) {
        self.coordinator = coordinator
        self.willChangeTabTo = willChangeTabTo
    }
    
    func changeTab() {
        coordinator.changeTab(with: willChangeTabTo)
    }
    
    @Published var alertItem: AlertItem?
}

struct SecondView: View {
    
    @ObservedObject var viewModel: SecondViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                    .padding()
                
                Button {
                    viewModel.changeTab()
                } label: {
                    Text("Change tab")
                }
                .padding()
            }
            
        }
    }
}
