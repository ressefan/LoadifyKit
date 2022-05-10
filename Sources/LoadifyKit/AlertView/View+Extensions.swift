//
//  File.swift
//  
//
//  Created by Vishweshwaran on 5/10/22.
//

import SwiftUI

extension View {
    public func showAlert(
        loaderState: LoaderState,
        showOverlay: Bool = false
    ) -> some View {
        ZStack {
            self.allowsHitTesting(!loaderState.isLoading)
            if loaderState.isLoading {
                Loader(title: loaderState.title, showOverlay: showOverlay)
            }
        }
    }
}
