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
    @State private var shouldShow = true
    
    var body: some View {
        HStack {
            if shouldShow {
                Text("Added ").transition(.opacity)
            }
            Button("Add To Cart") {
                withAnimation(.easeInOut(duration: 3.0)) {
                    self.shouldShow.toggle()
                }
            }
        }
    }
}
