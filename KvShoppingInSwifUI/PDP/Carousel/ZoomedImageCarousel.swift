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
    
    @State private var currentPage = 0
    
    init(
        product: PDPProduct?,
        selector: Binding<ZoomedImageSelector>
    ) {
        _zoomedImageSelector = selector
        self.urls = product?.images
            .sorted(by: { $0.rank < $1.rank })
            .compactMap { $0.value } ?? []
        
        if let url = selector.url.wrappedValue,
           let index = urls.firstIndex(where:  { $0 == url } ) {
            currentPage = index
        }
    }
    
    var body: some View {
        VStack {
            // create a paged horizontal side scrolling view
            ZStack(alignment: .top) {
                if let url = zoomedImageSelector.url {
                    Color.white
                    PagerView(
                        pageCount: urls.count,
                        currentIndex: $currentPage
                    ) {
                        ForEach(urls, id: \.self) { url in
                            carouselImage(url: url)
                        }
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
        AsyncImage(url: url)
        .edgesIgnoringSafeArea(.all)
        .padding()
        .onTapGesture(perform: {
            withAnimation {
                self.zoomedImageSelector.isZoomed.toggle()
            }
        })
    }
}
