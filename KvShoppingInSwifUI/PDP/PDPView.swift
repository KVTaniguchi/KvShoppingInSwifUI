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
    @ObservedObject var imageLoader = ImageLoader()
    @State var quantity = 0
    @State var showingCart = false
    
    init(plpModel: PLPViewModel) {
        self.plpModel = plpModel
        self.task = PDPProductTask(url: URL(string: "https://run.mocky.io/v3/9a6331f9-8ed6-453f-bbff-250b431bf141")!)
        self.task.getProducts()
    }
    
    var body: some View {
        List {
            ImageCarousel(product: task.product)
            ProductPlacard(product: task.product)
            ProductDescription(product: task.product)
            QuantityPicker(quantity: $quantity)
            ColorSelector()
            SizeSelector()
            AddToCartView(quantity: quantity)
        }.navigationBarTitle(Text(self.plpModel.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(
                action: {
                    self.showingCart.toggle()
                }) {
                    Image(systemName: "cart").imageScale(.large)
                }
        )
        .sheet(isPresented: $showingCart) {
            Cart()
        }
    }
}
