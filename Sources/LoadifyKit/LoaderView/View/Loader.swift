//
//  Loader.swift
//  Loadify
//
//  Created by Vishweshwaran on 5/9/22.
//

import SwiftUI

struct Loader: View {
    
    private let title: String
    private let showOverlay: Bool
    private let options: LoaderOptions
    
    init(title: String, showOverlay: Bool, options: LoaderOptions) {
        self.title = title
        self.showOverlay = showOverlay
        self.options = options
    }
    
    var body: some View {
        ZStack {
            overlayView(showOverlay)
            switch options.style {
            case .horizontal:
                horizontalLoader.loaderBackground()
            case .vertical:
                verticalLoader.loaderBackground()
            }
        }
    }
    
    private var horizontalLoader: some View {
        HStack(alignment: .center, spacing: 16) {
            ProgressView()
            titleView
        }
    }
    
    private var verticalLoader: some View {
        VStack(alignment: .center, spacing: 16) {
            ProgressView()
            titleView
        }
    }
    
    private var titleView: some View {
        Text("\(title)")
            .font(.headline)
            .foregroundColor(.white)
    }
    
    private func overlayView(_ canShowOverlay: Bool) -> some View {
        canShowOverlay ? Color.black.opacity(0.2): Color.clear
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader(title: "Fetching details...", showOverlay: false, options: .init(style: .vertical))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
