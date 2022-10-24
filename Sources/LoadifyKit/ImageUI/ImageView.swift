//
//  ImageView.swift
//  
//
//  Created by Vishweshwaran on 23/10/22.
//

import SwiftUI

public struct ImageView<Placeholder: View, ConfiguredImage: View>: View {
        
    @StateObject var imageLoader: ImageLoaderService
    @State private var uiImage: UIImage?
    
    private let placeholder: () -> Placeholder
    private let image: (Image) -> ConfiguredImage
    
    public init(
        urlString: String,
        @ViewBuilder placeholder: @escaping () -> Placeholder,
        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
    ) {
        self.placeholder = placeholder
        self.image = image    
        self._imageLoader = StateObject(wrappedValue: ImageLoaderService(urlString: urlString))
    }
    
    public var body: some View {
        ZStack {
            /// Shows progressView if the image is not yet downloaded from the `URLSession`
            if imageLoader.shouldShowLoader {
                ProgressView()
            } else {
                /// Actual `imageContent` downloaded from the `URLSession` or `Placeholder` image.
                imageContent
            }
        }
        .onChange(of: imageLoader.uiImage, perform: { imageData in
            self.uiImage = imageData
        })
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

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let imageURL = "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-refurb-about-201810?wid=984&hei=859&fmt=jpeg&qlt=90&.v=1541530952135"
        ImageView(urlString: imageURL) {
            Image(systemName: "applelogo")
                .imageScale(.large)
        } image: { imageView in
            imageView
                .resizable()
        }
    }
}
