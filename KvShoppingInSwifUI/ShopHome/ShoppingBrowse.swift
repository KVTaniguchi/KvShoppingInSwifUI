//
//  ShoppingBrowse.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

// grid of random image views
// of random size
// clicking any loads the plp with the same data

struct ShoppingBrowse: View {
    @State var showingCart = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: PLPView()
                ) {
                    Text("Thing")
                }
                NavigationLink(
                    destination: PLPView()
                ) {
                    Text("more")
                }
            }.navigationBarTitle("shopping", displayMode: .automatic)
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
}
