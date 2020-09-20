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
    @Published var things: [UIImage] = []
    var cancelables = Set<AnyCancellable>()
    
    func load(url: URL) {
        
        if cache[url] == nil {
            print(url.absoluteString)
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
            .eraseToAnyPublisher()
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
//                var cache = cache
                // TODO figure out way to not get self here
//                cache[url] = value
                self?.things = value
            })
            .store(in: &cancelables)
        }
    }
}

struct AsyncImage: View {
    private let url: URL
    @State private var opacity: Double = 0
    
    @ObservedObject var loader = ImageLoader.shared
    
    init(url: URL) {
        self.url = url
        
        if loader.cache[url] == nil {
            loader.load(url: url)
        }
    }
    
    private var image: some View {
        Group {
            if let image = loader.things.randomElement() {
                Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .onAppear {
                    self.opacity = 1
                }
            } else {
                Image(systemName: "xmark.octagon.fill")
            }
        }
    }
    
    var body: some View {
        image
        .opacity(opacity)
        .animation(.easeInOut(duration: 0.25))
    }
}
