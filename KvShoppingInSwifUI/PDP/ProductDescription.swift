//
//  ProductDescription.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/20/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ProductDescription: View {
    let product: PDPProduct?
    
    var body: some View {
        DisclosureGroup("Details") {
            Text(product?.details ?? "no details")
        }
    }
}
