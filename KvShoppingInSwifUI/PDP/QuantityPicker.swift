//
//  QuantityPicker.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/12/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct QuantityPicker: View {
    @State var selectedQuantity = 0
    
    var body: some View {
        Picker(selection: $selectedQuantity, label: Text("Please choose a quantity")) {
            ForEach(1 ..< 11) {
               Text("\($0)")
            }
        }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        QuantityPicker()
    }
}
