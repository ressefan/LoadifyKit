//
//  ProgressUI.swift
//  
//
//  Created by Vishweshwaran on 02/10/22.
//

import SwiftUI
import FontKit

public struct ProgressUI: View {
    
    @Binding var value: Double
    
    public init(value: Binding<Double>) {
        self._value = value
    }
    
    public var body: some View {
        ZStack {
            Blur(style: .systemMaterialDark)
            VStack(alignment: .leading) {
                Text("Downloading...")
                    .font(.inter(.bold(size: 22)))
                    .foregroundColor(.white)
                ProgressView(value: value)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color("blue_accent", bundle: .module)))
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct ProgressUIModifier: ViewModifier {
    
    @Binding var shouldShow: Bool
    @Binding var value: Double
    
    func body(content: Content) -> some View {
        content
            .if($shouldShow.wrappedValue, transform: { view in
                view
                    .overlay(ProgressUI(value: $value))
                    .edgesIgnoringSafeArea(.all)
            })
    }
}

extension View {
    public func showProgressBar(when shouldShow: Binding<Bool>, progressValue: Binding<Double>) -> some View {
        modifier(ProgressUIModifier(shouldShow: shouldShow, value: progressValue))
    }
}

struct ProgressUI_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            Text("Loadify")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showProgressBar(when: .constant(true), progressValue: .constant(0.50))
    }
}
