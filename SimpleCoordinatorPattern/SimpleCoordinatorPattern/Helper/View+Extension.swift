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
}
