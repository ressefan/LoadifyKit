//
//  LoaderBackground.swift
//  
//
//  Created by Vishweshwaran on 5/18/22.
//

import SwiftUI

struct LoaderBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Blur())
            .cornerRadius(12)
    }
}
