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
    @StateObject var task = FetchTask<PDPProduct>(url: URL(string: "https://run.mocky.io/v3/9a6331f9-8ed6-453f-bbff-250b431bf141")!) "https://run.mocky.io/v3/9a6331f9-8ed6-453f-bbff-250b431bf141")!)
    @StateObject var imageLoader = ImageLoader()
    @State var quantity = 0
    @State var showingCart = false
    
    init(plpModel: PLPViewModel) {
        self.plpModel = plpModel
    }
    
    var body: some View {
        List {
            ImageCarousel(product: task.model)
            ProductPlacard(product: task.model)
            ProductDescription(product: task.model)
            QuantityPicker(quantity: $quantity)
            ColorSelector()
            SizeSelector()
            AddToCartView(quantity: quantity)
        }
        .onAppear(perform: {
            self.task.fetchModel()
        })
        .navigationBarTitle(Text(self.plpModel.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(
                action: {
                    self.showingCart.toggle()
                }) {
                    Image(systemName: "cart").imageScale(.large)
                }
        )
        .sheet(isPresented: $showingCart) {
            CartView()
        }
    }
}
