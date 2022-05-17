//
//  Loader.swift
//  Loadify
//
//  Created by Vishweshwaran on 5/9/22.
//

import SwiftUI

struct Loader: View {
    
    let title: String
    let showOverlay: Bool
    
    init(title: String, showOverlay: Bool) {
        self.title = title
        self.showOverlay = showOverlay
    }
    
    var body: some View {
        ZStack {
            overlayView
            HStack(spacing: 16) {
                ProgressView()
                titleView
            }
            .frame(width: 180, height: 80)
            .padding()
            .background(Blur())
            .cornerRadius(8)
        }
    }
    
    private var titleView: some View {
        Text("\(title)")
            .padding(.top)
            .font(.headline)
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    private var overlayView: some View {
        if showOverlay {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader(title: "Fetching Details...", showOverlay: false)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
