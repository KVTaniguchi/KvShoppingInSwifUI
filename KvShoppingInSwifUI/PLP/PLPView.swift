//
//  ProductListingPage.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

/// View that shows
/// smaller product image
/// price / sale price
/// name
/// reviews
/// promotion message, if any
struct PLPView: View {
    @ObservedObject var task: PLPProductsTask
    
    init() {
        self.task = PLPProductsTask(url: URL(string: "https://run.mocky.io/v3/2ff35b86-da35-4cae-9d91-3160cae55837")!)
        task.getProducts()
    }
    
    var body: some View {
        List(task.productViewModels) { product in
            PLPItemView(plpVM: product)
        }
    }
}

//struct ProductListingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductListingPage()
//    }
//}
