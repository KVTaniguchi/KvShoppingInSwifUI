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
    @StateObject var loader = ImageLoader.shared
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        Group {
            if let image = loader.cache[url] {
                Image(uiImage: image)
                .resizable()
                .scaledToFit()
            } else {
                Image(systemName: "pencil")
            }
        }.onAppear {
            if loader.cache[url] == nil {
                loader.load(url: url)
            }
        }
    }
}
