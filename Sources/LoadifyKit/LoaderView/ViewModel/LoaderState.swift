//
//  File.swift
//  
//
//  Created by Vishweshwaran on 5/10/22.
//

import Foundation

public final class LoaderState: ObservableObject {
    
    @Published var isLoading: Bool = false
    private(set) var title: String = ""
    
    public init() {
        print("Loader State Init")
    }
    
    public func showLoader(title: String) {
        self.title = title
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    public func hideLoader() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
