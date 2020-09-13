//
//  ProductDetailPage.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct PDPView: View {
    let plpModel: PLPViewModel
    @ObservedObject var task: PDPProductTask
    @ObservedObject var imageLoader = ImageLoader.shared
    
    init(plpModel: PLPViewModel) {
        self.plpModel = plpModel
        self.task = PDPProductTask(url: URL(string: "https://run.mocky.io/v3/9a6331f9-8ed6-453f-bbff-250b431bf141")!)
        self.task.getProducts()
    }
    
    var body: some View {
        List {
            ImageCarousel()
            ProductPlacard()
            QuantityPicker()
            ColorSelector()
            SizeSelector()
            AddToCartView()
        }.navigationBarTitle(Text(self.plpModel.name), displayMode: .inline)
        
        // images carousel
        // title
        // price
        // quantity picker
        // color selector
        // size selector
        // ratings and reviews
        // expandable description cell
        // add to cart button
    }
}
