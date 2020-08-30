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

class ImageLoader: ObservableObject {
    static let shared = ImageLoader()
    
    @Published var cache: [URL: UIImage] = [:]
    var cancelables = Set<AnyCancellable>()
    
    func load(url: URL) {
        if cache[url] == nil {
            _ = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: UIImage(systemName: "xmark.octagon.fill") )
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                self?.cache[url] = value
            })
            .store(in: &cancelables)
        }
    }
}

struct AsyncImage: View {
    private let url: URL
    
    @ObservedObject var loader = ImageLoader.shared
    
    init(url: URL) {
        self.url = url
        loader.load(url: url)
    }
    
    private var image: some View {
        Group {
            if loader.cache[url] != nil {
                Image(uiImage: loader.cache[url]!)
                .resizable()
                .scaledToFit()
            } else {
                Image(systemName: "xmark.octagon.fill")
            }
        }
    }
    
    var body: some View {
        image
    }
}
