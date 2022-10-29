//
//  LoadifyKit.swift
//  
//
//  Created by Vishweshwaran on 29/10/22.
//

import SwiftUI

public typealias LoadifyColors = LoadifyKit.ColorKit
public typealias LoadifyAssets = LoadifyKit.AssetKit

public struct LoadifyKit {
    
    public struct AssetKit {
        public static let loadifyHorizontal = Image("loadify_horizontal", bundle: .module)
        public static let loadifyIcon = Image("loadify_icon", bundle: .module)
        public static let notFound = Image("not_found", bundle: .module)
    }
}
