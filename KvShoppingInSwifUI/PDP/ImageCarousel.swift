//
//  ImageCarousel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/7/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ImageCarousel: View {
    let urls: [URL]
    @StateObject var imageLoading = ImageLoader.shared
    
    @Binding var zoomedSelector: ZoomedImageSelector
    
    init(
        product: PDPProduct?,
        selector: Binding<ZoomedImageSelector>
    ) {
        _zoomedSelector = selector
        self.urls = product?.images
            .sorted(by: { $0.rank < $1.rank })
            .compactMap { $0.value } ?? []
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(urls, id: \.self) { url in
                    AsyncImage(url: url)
                    .frame(width: 80, height: 120, alignment: .leading)
                    .padding()
                    .onTapGesture(perform: {
                        withAnimation {
                            self.zoomedSelector.url = url
                            self.zoomedSelector.isZoomed.toggle()
                        }
                    })
                }
            }
        }
    }
}
