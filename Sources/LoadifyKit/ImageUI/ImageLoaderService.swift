//
//  ImageLoaderService.swift
//  
//
//  Created by Vishweshwaran on 23/10/22.
//

import Foundation
import UIKit

final class ImageLoaderService: ObservableObject {
    
    @Published var uiImage: UIImage = UIImage()
    @Published var shouldShowLoader: Bool = false
    
    convenience init(urlString: String?) {
        self.init()
        loadData(from: urlString)
    }
    
    func loadData(from urlString: String?) {
        setLoaderState(to: true)
        guard let urlString, let url = URL(string: urlString) else {
            return setLoaderState(to: false)
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self else { return }
            guard let data else { return self.setLoaderState(to: false) }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.uiImage = UIImage(data: data) ?? UIImage()
                self.setLoaderState(to: false)
            }
        }
        setLoaderState(to: false)
        task.resume()
    }
    
    private func setLoaderState(to loaderState: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.shouldShowLoader = loaderState
        }
    }
}
