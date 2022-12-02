//
//  HideTabbarOnPush.swift
//  SimpleCoordinatorPattern
//
//  Created by Onur Yıldırım on 2.12.2022.
//

import SwiftUI

struct HideTabbar: UIViewControllerRepresentable {
    
    func makeCoordinator() -> HideTabbar.Coordinator {
        Coordinator(shouldHideTabbar: shouldHideTabbar)
    }
    
    let shouldHideTabbar: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<HideTabbar>) -> UIViewController {
        context.coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<HideTabbar>) {
    }

    typealias UIViewControllerType = UIViewController

    class Coordinator: UIViewController {
        
        let shouldHideTabbar: Bool

        init(shouldHideTabbar: Bool) {
            self.shouldHideTabbar = shouldHideTabbar
            
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            tabBarController?.tabBar.isHidden = shouldHideTabbar
        }
    }
}

struct HideTabbarModifier: ViewModifier {
    let shouldHideTabbar: Bool
    
    func body(content: Content) -> some View {
        content
            .background(HideTabbar(shouldHideTabbar: shouldHideTabbar))
    }
}
