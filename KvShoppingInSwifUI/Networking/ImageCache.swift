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
    
    private var needsLoad = Set<URL>()
    private var isLoading = false
    
    func load(url: URL) {
        
        needsLoad.insert(url)
        
        if cache[url] == nil {
            if isLoading {
                return
            }
            
            isLoading = true
            
            _ = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: UIImage(systemName: "xmark.octagon.fill") )
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                self?.isLoading = false
                self?.cache[url] = value
                self?.needsLoad.remove(url)
                if let nextUrl = self?.needsLoad.first {
                    self?.load(url: nextUrl)
                }
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
            if loader.cache[url] != nil {
                Image(uiImage: loader.cache[url]!)
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
