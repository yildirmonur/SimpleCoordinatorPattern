//
//  WillDisappearHandler.swift
//  SimpleCoordinatorPattern
//
//  Created by Onur Yıldırım on 2.12.2022.
//

import SwiftUI

struct ViewWillHandler: UIViewControllerRepresentable {
    func makeCoordinator() -> ViewWillHandler.Coordinator {
        Coordinator(onWillDisappear: onWillDisappear, onWillAppear: onWillAppear)
    }

    let onWillDisappear: () -> Void
    let onWillAppear: () -> Void

    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewWillHandler>) -> UIViewController {
        context.coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewWillHandler>) {
    }

    typealias UIViewControllerType = UIViewController

    class Coordinator: UIViewController {
        let onWillDisappear: () -> Void
        let onWillAppear: () -> Void

        init(onWillDisappear: @escaping () -> Void,
             onWillAppear: @escaping () -> Void) {
            self.onWillDisappear = onWillDisappear
            self.onWillAppear = onWillAppear
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            onWillDisappear()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            onWillAppear()
        }
    }
}

struct WillDisappearModifier: ViewModifier {
    let disAppear: () -> Void
    let appear: () -> Void

    func body(content: Content) -> some View {
        content
            .background(ViewWillHandler(onWillDisappear: disAppear, onWillAppear: appear))
    }
}
