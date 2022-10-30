//
//  InfoView.swift
//  
//
//  Created by Vishweshwaran on 30/10/22.
//

import SwiftUI

public struct InfoView: View {
    
    private var title: String
    private var subTitle: String
    
    public init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    public var body: some View {
        VStack {
            Text("\(title)")
                .font(.headline)
                .fontWeight(.heavy)
                .lineLimit(1)
            Text("\(subTitle)")
                .font(.footnote)
                .foregroundColor(LoadifyColors.greyText)
        }
        .foregroundColor(.white)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(title: "31 lakh", subTitle: "Likes")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
