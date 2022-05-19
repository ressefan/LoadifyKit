//
//  File.swift
//  
//
//  Created by Vishweshwaran on 5/10/22.
//

import SwiftUI

extension View {
    /// This will return a loader from LoaderKit.
    /// This functions helps you to register loader in the rootView and can be acessible by creating and instance of the **LoaderViewAction**
    /// - Parameters:
    ///   - loaderAction: Lifecycle of the loaderAction
    ///   - showOverlay: Bool property to add black background behind the loader when it is active. By default it is false
    ///   - options: This gives some View of type LoaderView
    public func addLoaderView(
        for loaderAction: LoaderViewAction,
        showOverlay: Bool = false,
        options: LoaderOptions = LoaderOptions()
    ) -> some View {
        ZStack {
            self.allowsHitTesting(!loaderAction.isLoading)
            if loaderAction.isLoading {
                LoaderView(
                    title: loaderAction.title,
                    subTitle: loaderAction.subTitle,
                    showOverlay: showOverlay,
                    options: options
                )
            }
        }
    }
    
    public func addAlertView(
        for alertAction: AlertViewAction
    ) -> some View {
        ZStack {
            self.allowsHitTesting(!alertAction.isShowing)
            if alertAction.isShowing {
                AlertView(
                    title: alertAction.title,
                    subTitle: alertAction.subTitle,
                    showOverlay: alertAction.showOverlay,
                    options: alertAction.options
                )
            }
        }
    }
    
    func loaderBackground() -> some View {
        modifier(LoaderBackground())
    }
}

