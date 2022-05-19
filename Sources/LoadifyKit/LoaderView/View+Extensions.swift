//
//  File.swift
//  
//
//  Created by Vishweshwaran on 5/10/22.
//

import SwiftUI

extension View {
    /// This will return a loader from LoaderKit.
    /// This functions helps you to register loader in the rootView and can be acessible by creating and instance of the **LoaderState**
    /// - Parameters:
    ///   - loaderState: Lifecycle of the loaderState
    ///   - showOverlay: Bool property to add black background behind the loader when it is active. By default it is false
    ///   - options: This gives some View of type Loader
    public func showAlert(
        loaderState: LoaderState,
        showOverlay: Bool = false,
        options: LoaderOptions = LoaderOptions()
    ) -> some View {
        ZStack {
            self.allowsHitTesting(!loaderState.isLoading)
            if loaderState.isLoading {
                Loader(
                    title: loaderState.title,
                    subTitle: loaderState.subTitle,
                    showOverlay: showOverlay,
                    options: options
                )
            }
        }
    }
    
    func loaderBackground() -> some View {
        modifier(LoaderBackground())
    }
}

