//
//  ZoomedImageCarousel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 1/23/21.
//  Copyright © 2021 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ZoomedImageCarousel: View {
    let url: URL
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            Text("show \(url)")
        }
    }
}
