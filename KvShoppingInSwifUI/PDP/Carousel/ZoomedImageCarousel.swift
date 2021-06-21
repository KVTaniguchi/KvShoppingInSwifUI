//
//  ZoomedImageCarousel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 1/23/21.
//  Copyright © 2021 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ZoomedImageCarousel: View {
    @Binding var zoomedImageSelector: ZoomedImageSelector
    private let urls: [URL]
    
    init(
        product: PDPProduct?,
        selector: Binding<ZoomedImageSelector>
    ) {
        _zoomedImageSelector = selector
        self.urls = product?.images
            .sorted(by: { $0.rank < $1.rank })
            .compactMap { $0.value } ?? []
    }
    
    var body: some View {
        VStack {
            // create a paged horizontal side scrolling view
            ZStack(alignment: .top) {
                Color.white
                PagerView(
                    pageCount: urls.count,
                    currentIndex: $zoomedImageSelector.currentIndex
                ) {
                    ForEach(urls, id: \.self) { url in
                        carouselImage(url: url)
                    }
                }
            }
            // paging indicator
            Button("Close") {
                withAnimation {
                    self.zoomedImageSelector.isZoomed.toggle()
                }
            }.offset(y: -20)
        }
    }
    
    // todo get the selected image first
    private func carouselImage(url: URL) -> some View {
        KVAsyncImage(url: url)
        .edgesIgnoringSafeArea(.all)
        .padding()
        .onTapGesture(perform: {
            withAnimation {
                self.zoomedImageSelector.isZoomed.toggle()
            }
        })
    }
}
