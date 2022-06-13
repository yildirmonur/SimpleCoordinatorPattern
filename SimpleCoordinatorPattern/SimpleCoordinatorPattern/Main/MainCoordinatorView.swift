//
//  MainCoordinatorView.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

struct MainCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: MainCoordinator
    
    // MARK: Views
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            FirstCoordinatorView(
                coordinator: coordinator.firstCoordinator
            )
            .tabItem { Label("First", systemImage: "doc.text.magnifyingglass") }
            .tag(MainTab.first)
            
            SecondCoordinatorView(
                coordinator: coordinator.secondCoordinator
            )
            .tabItem { Label("Second", systemImage: "star.fill") }
            .tag(MainTab.second)
        }
    }
}

