//
//  ProductListingPage.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Combine
import SwiftUI

/// View that shows
/// smaller product image
/// price / sale price
/// name
/// reviews
/// promotion message, if any
struct PLPView: View {
    @ObservedObject var task: PLPProductsTask
    @ObservedObject var imageLoader = ImageLoader.shared
    
    init() {
        self.task = PLPProductsTask(url: URL(string: "https://run.mocky.io/v3/99de5e9a-ec4d-4bf2-9f92-4589e7225f2a")!)
        self.task.getProducts()
    }
    
    var body: some View {
        List(task.productViewModels) { product in
            PLPItemView(plpVM: product).onAppear {
                if self.task.finished {
                    self.imageLoader.load(url: product.imageUrl)
                }
            }
        }
    }
}

//struct ProductListingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductListingPage()
//    }
//}
