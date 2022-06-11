//
//  Loader.swift
//  
//
//  Created by Vishweshwaran on 11/06/22.
//

import SwiftUI

public struct Loader: View {
    
    public let title: String
    public let showOverlay: Bool
    
    public init(
        title: String,
        showOverlay: Bool = false
    ) {
        self.title = title
        self.showOverlay = showOverlay
    }
    
    public var body: some View {
        ZStack {
            overlayView(showOverlay)
            ProgressView(title)
                .font(.caption)
                .loaderBackground()
        }
    }
    
    private func overlayView(_ canShowOverlay: Bool) -> some View {
        canShowOverlay ? Color.black.opacity(0.2): Color.clear
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Loader(title: "LOADING", showOverlay: false)
            Loader(title: "LOADING", showOverlay: false)
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
