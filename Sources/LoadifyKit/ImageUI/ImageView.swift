//
//  ImageView.swift
//  
//
//  Created by Vishweshwaran on 23/10/22.
//

import SwiftUI

public struct ImageView<Placeholder: View, ConfiguredImage: View>: View {
    
    @StateObject var imageLoader = ImageLoaderService()
    @State private var uiImage: UIImage?
    
    public var urlString: String
    
    private let placeholder: () -> Placeholder
    private let image: (Image) -> ConfiguredImage
    
    public init(
        urlString: String,
        @ViewBuilder placeholder: @escaping () -> Placeholder,
        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
    ) {
        self.urlString = urlString
        self.placeholder = placeholder
        self.image = image
    }
    
    public var body: some View {
        imageContent
            .onChange(of: imageLoader.data) { data in
                guard let data else { return }
                self.uiImage = UIImage(data: data)
            }
            .onAppear {
                imageLoader.loadData(from: urlString)
            }
    }
    
    @ViewBuilder
    private var imageContent: some View {
        if let uiImage {
            image(Image(uiImage: uiImage))
        } else {
            placeholder()
        }
    }
}
