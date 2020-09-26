//
//  Checkout.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

// any discounts / payments to apply
// cart total
// delivery / shipping address

struct Checkout: View {
    var body: some View {
        List {
            Text("Order summary")
            Text("Fulfillment summary")
            Text("Payment Summary")
            Text("Cost Summary")
            Text("Place order button")
        }
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
