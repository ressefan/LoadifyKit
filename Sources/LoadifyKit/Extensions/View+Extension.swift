//
//  View+Extension.swift
//  
//
//  Created by Vishweshwaran on 30/10/22.
//

import SwiftUI

public extension View {
    
    func embedInNavigation() -> some View {
        NavigationView { self }
    }
    
    func cardView(color: Color, cornerRadius: CGFloat = 10) -> some View {
        modifier(CardView(color: color, cornerRadius: cornerRadius))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(
        _ condition: @autoclosure () -> Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
