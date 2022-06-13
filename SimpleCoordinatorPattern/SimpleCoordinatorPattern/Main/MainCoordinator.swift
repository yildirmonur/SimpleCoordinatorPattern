//
//  MainCoordinator.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 13.06.2022.
//

import Foundation
import SwiftUI

enum MainTab {
    case first
    case second
}

@MainActor
class MainCoordinator: ObservableObject {

    // MARK: Stored Properties
    
    @Published var tab = MainTab.first
    
    @Published var firstCoordinator: FirstCoordinator!
    @Published var secondCoordinator: SecondCoordinator!
    
    init() {
        firstCoordinator = .init(parent: self)
        secondCoordinator = .init(parent: self, willChangeTabTo: .first)
    }
}
