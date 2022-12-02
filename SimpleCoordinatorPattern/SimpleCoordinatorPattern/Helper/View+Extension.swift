//
//  View+Extension.swift
//  SimpleCoordinatorPattern
//
//  Created by Onur Yıldırım on 2.12.2022.
//

import SwiftUI

extension View {
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    func onWill(disAppear: @escaping () -> Void, appear: @escaping () -> Void) -> some View {
        self.modifier(WillDisappearModifier(disAppear: disAppear, appear: appear))
    }
    
    func hideTabbar(shouldHideTabbar: Bool) -> some View {
        self.modifier(HideTabbarModifier(shouldHideTabbar: shouldHideTabbar))
    }
}
