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
    @StateObject var task: PLPProductsTask = PLPProductsTask(url: URL(string: "https://run.mocky.io/v3/99de5e9a-ec4d-4bf2-9f92-4589e7225f2a")!)
    @State private var showingCart = false
    
    var body: some View {
        switch task.result {
        case .success(let models):
            List(models) { product in
                NavigationLink(destination: PDPView(plpModel: product)) {
                    PLPItemView(plpVM: product)
                }
            }
            .navigationBarTitle("products list")
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
        case .failure(let error):
            Text(error.localizedDescription)
        case .none:
            ProgressView().onAppear(perform: {
                self.task.getProducts()
            })
        }
    }
}
