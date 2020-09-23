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

struct Cart: View {
    var body: some View {
        VStack {
            Text("Items header")
            Text("Item 1")
            Text("Items 2")
            Text("Shipping to")
            Text("Cost summary")
            Text("Checkout button")
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}


// cart item view
