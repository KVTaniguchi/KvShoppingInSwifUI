//
//  ImageCache.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/16/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//  unable to determine interface type without an established connection

enum ImageError: Error {
    case badImage
}

class ImageLoader: ObservableObject {
    static let shared = ImageLoader()
    
    @Published var cache: [URL: UIImage] = [:]
    var cancelables = Set<AnyCancellable>()
    
    func load(url: URL) {
        cache[url] = UIImage(systemName: "pencil")!
        
        _ = URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode,
                  let img = UIImage(data: data)
            else {
                throw ImageError.badImage
            }
            
            return img
        }
        .replaceError(with: UIImage(systemName: "pencil")! )
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self, url] value in
            self?.cache[url] = value
        })
        .store(in: &cancelables)
    }
}
