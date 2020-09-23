//
//  AsyncImage.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/22/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

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
            if let image = loader.cache[url] {
                Image(uiImage: image)
                .resizable()
                .scaledToFit()
            } else {
                Image(systemName: "pencil")
            }
        }
    }
    
    var body: some View {
        image
    }
}
