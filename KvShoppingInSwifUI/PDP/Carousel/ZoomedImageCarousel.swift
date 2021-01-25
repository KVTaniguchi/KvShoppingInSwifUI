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
    
    var body: some View {
        VStack {
            // create a paged horizontal side scrolling view
            ZStack(alignment: .top) {
                if let url = zoomedImageSelector.url {
                    Color.white
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
            // paging indicator
            Button("Close") {
                withAnimation {
                    self.zoomedImageSelector.isZoomed.toggle()
                }
            }.offset(x: -5, y: -5)
        }
    }
}
