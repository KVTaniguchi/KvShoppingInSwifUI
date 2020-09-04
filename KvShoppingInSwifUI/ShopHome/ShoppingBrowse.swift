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
        }
    }
}

//struct ShoppingBrowse_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingBrowse()
//    }
//}
