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
            .frame(maxWidth: 230, maxHeight: 60)
            .padding()
            .background(Blur())
            .cornerRadius(12)
    }
}
