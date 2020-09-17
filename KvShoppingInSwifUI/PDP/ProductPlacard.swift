//
//  ProductPlacard.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/12/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ProductPlacard: View {
    let product: PDPProduct?
    
    init(product: PDPProduct?) {
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product?.name ?? "...")
            Text(product?.listingPriceString ?? "...")
        }
    }
}
