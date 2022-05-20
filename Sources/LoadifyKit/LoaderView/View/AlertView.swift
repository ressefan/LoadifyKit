//
//  AlertView.swift
//  
//
//  Created by Vishweshwaran on 5/19/22.
//

import SwiftUI

struct AlertView: View {
    
    private let title: String
    private let subTitle: String?
    private let showOverlay: Bool
    private let options: AlertOptions
    
    init(title: String, subTitle: String?, showOverlay: Bool, options: AlertOptions) {
        self.title = title
        self.subTitle = subTitle
        self.showOverlay = showOverlay
        self.options = options
    }
    
    var body: some View {
//            overlayView(showOverlay)
            switch options.style {
            case .horizontal:
                horizontalLoader.loaderBackground()
            case .vertical:
                verticalLoader.loaderBackground()
            }
    }
    
    private var horizontalLoader: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: options.alertType.rawValue)
                .font(.largeTitle)
                .foregroundColor(options.alertType == .error ? .red : .yellow)
            contentView
        }
        .frame(maxWidth: .infinity)
    }
    
    private var verticalLoader: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(systemName: options.alertType.rawValue)
                .font(.largeTitle)
                .foregroundColor(options.alertType == .error ? .red : .yellow)
            contentView
        }
    }
    
    private var contentView: some View {
        VStack(alignment: options.style == .vertical ? .center : .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            subTitle.map({
                Text($0)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            })
        }
    }
    
    private func overlayView(_ canShowOverlay: Bool) -> some View {
        canShowOverlay ? Color.black.opacity(0.2): Color.clear
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlertView(title: "Error", subTitle: "URL cannot be empty", showOverlay: false, options: .init(alertType: .error, style: .vertical))
            AlertView(title: "Warning", subTitle: "Something went wrong", showOverlay: false, options: .init(alertType: .warning, style: .horizontal))
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
