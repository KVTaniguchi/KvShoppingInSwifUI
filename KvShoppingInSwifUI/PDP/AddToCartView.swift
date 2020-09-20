//
//  AddToCartView.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/12/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct AddToCartView: View {
    var quantity: Int
    
    var body: some View {
        Button("Add To Cart") {
            print(quantity)
        }
    }
}
