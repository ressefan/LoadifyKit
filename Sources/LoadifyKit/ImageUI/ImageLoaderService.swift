//
//  ImageLoaderService.swift
//  
//
//  Created by Vishweshwaran on 23/10/22.
//

import Foundation
import UIKit

final class ImageLoaderService: ObservableObject {
    
    @Published var data: Data?

    func loadData(from urlString: String?) {
        guard let urlString, let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.data = data
            }
        }
        task.resume()
    }
}
