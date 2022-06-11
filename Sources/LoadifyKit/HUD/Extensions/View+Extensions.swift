//
//  File.swift
//  
//
//  Created by Vishweshwaran on 5/10/22.
//

import SwiftUI

extension View {
    
    /// This will return a loader from LoaderKit.
    /// This functions helps you to present `Loader` on top of the View Hierarchy
    /// - Parameters:
    ///   - title: Title of the loader to be displayed.
    ///   - showOverlay: Bool property to add black background behind the loader when it is active. By default it is false
    ///   - isPresented: isPresented is used to toggle the loader's state
    public func showLoader(
        _ title: String,
        shouldShowOverlay: Bool = false,
        isPresented: Binding<Bool>
    ) -> some View {
        ZStack {
            self.allowsHitTesting(!isPresented.wrappedValue)
            if isPresented.wrappedValue {
                Loader(title: title, showOverlay: shouldShowOverlay)
            }
        }
    }
    
    /// This will return an Alert from LoaderKit.
    /// This functions helps you to present `Alert` on top of the View Hierarchy
    /// - Parameters:
    ///   - item: Error item to be displayed.
    ///   - content: Closure to show `Alert` and display error message
    public func showAlert<T: View>(item: Binding<Error?>, for duration: TimeInterval = 2.5, content: (Error) -> T) -> some View {
        ZStack {
            self.allowsHitTesting(item.wrappedValue != nil ? false : true)
            if let error = item.wrappedValue {
                content(error)
                    .dismiss(delay: duration) {
                        item.wrappedValue = nil
                    }
            }
        }
    }
    
    /// This will return an Alert from LoaderKit.
    /// This functions helps you to present `Alert` on top of the View Hierarchy
    /// - Parameters:
    ///   - isPresented: Bool to indicate to show Alert on the View heriracy
    ///   - content: Closure to show `Alert` and display alert message
    public func showAlert<T: View>(isPresented: Binding<Bool>, for duration: TimeInterval = 2.5, content: () -> T) -> some View {
        ZStack {
            self.allowsHitTesting(!isPresented.wrappedValue)
            if isPresented.wrappedValue {
                content()
                    .dismiss(delay: duration) {
                        isPresented.wrappedValue = false
                    }
            }
        }
    }
    
    internal func dismiss(delay: TimeInterval, completion: @escaping () -> Void) -> some View {
        self.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                completion()
            }
        }
    }
    
    /// This will return a loader from LoaderKit.
    /// This functions helps you to register loader in the rootView and can be acessible by creating and instance of the **LoaderViewAction**
    /// - Parameters:
    ///   - loaderAction: Lifecycle of the loaderAction
    ///   - showOverlay: Bool property to add black background behind the loader when it is active. By default it is false
    ///   - options: This gives some View of type LoaderView
    @available(*, deprecated, message: "use showLoader instead.")
    public func addLoaderView(
        for loaderAction: LoaderViewAction,
        showOverlay: Bool = false,
        options: LoaderOptions = LoaderOptions()
    ) -> some View {
        ZStack {
            self
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
    
    @available(*, deprecated, message: "use showAlert instead.")
    public func addAlertView(
        for alertAction: AlertViewAction
    ) -> some View {
        ZStack {
            self
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
    
    /// Uses VisualEffectsView to blur the background beneath the views
    internal func loaderBackground(colors: [Color]? = nil) -> some View {
        modifier(LoaderBackground(colors: colors))
    }
    
    /// Limits the font size for selected lines
    internal func reduceFontSize(for line: Int) -> some View {
        modifier(FontReducer(line: line))
    }
}

