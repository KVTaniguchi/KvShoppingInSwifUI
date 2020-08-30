//
//  PLPView.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/9/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct PLPItemView: View {
    let plpVM: PLPViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: plpVM.imageUrl)
            .frame(width: 80, height: 120, alignment: .leading)
            .padding()
            VStack(alignment: .leading) {
                Text(plpVM.name)
                Text(plpVM.listingPriceDisplay)
                Text(plpVM.salePriceDisplay)
                Text(plpVM.shortPromoMessage)
            }
            .padding()
        }
    }
}
