//
//  SimpleCoordinatorPatternApp.swift
//  SimpleCoordinatorPattern
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import SwiftUI

@main
struct SimpleCoordinatorPatternApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: MainCoordinator())
        }
    }
}
