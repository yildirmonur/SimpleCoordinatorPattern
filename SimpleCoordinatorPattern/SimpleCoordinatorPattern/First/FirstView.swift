//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 8.06.2022.
//

import SwiftUI

class FirstViewModel: ObservableObject {
    
    unowned let coordinator: FirstCoordinator
    
    init(coordinator: FirstCoordinator) {
        self.coordinator = coordinator
    }
    
    @MainActor
    func showAlert(error: CustomError) {
        coordinator.alertItem = error.showUrlAlert()
    }
    
}

struct FirstView: View {
    
    @ObservedObject var viewModel: FirstViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.showAlert(error: .invalidData)
            } label: {
                Text("Show alert")
            }
            .padding()
            
            Button {
                viewModel.coordinator.openSecond()
            } label: {
                Text("Navigate to second")
            }
        }
    }
}

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There is an error trying to reach the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
}

enum CustomError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    
    func showUrlAlert() -> AlertItem {
        switch self {
        case .invalidData:
            return AlertContext.invalidData
            
        case .invalidURL:
            return AlertContext.invalidURL
            
        case .invalidResponse:
            return AlertContext.invalidResponse
            
        case .unableToComplete:
            return AlertContext.unableToComplete
        }
    }
}
