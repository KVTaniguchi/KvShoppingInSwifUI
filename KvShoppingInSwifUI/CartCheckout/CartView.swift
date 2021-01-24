//
//  Cart.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

// a list of plp like views with quantity
// a summary section with cart total

struct CartView: View {
    @State private var showingCheckout = false
    
    var body: some View {
        List {
            Text("Items header")
            Text("Item 1")
            Text("Items 2")
            Text("Shipping to")
            Text("Cost summary")
            Button("Checkout") {
                self.showingCheckout.toggle()
            }
        }.sheet(isPresented: $showingCheckout) {
            Checkout()
        }
    }
}
