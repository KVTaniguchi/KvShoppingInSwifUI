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
            textStack
            .padding()
        }
    }
    
    var textStack: some View {
        Group {
            if plpVM.salePriceDisplay.isEmpty {
                NotOnSale(plpVM: plpVM)
            } else {
                OnSale(plpVM: plpVM)
            }
        }
    }
}

struct OnSale: View {
    let plpVM: PLPViewModel
    
    init(plpVM: PLPViewModel) {
        self.plpVM = plpVM
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(plpVM.name)
            Text(plpVM.listingPriceDisplay)
            Text(plpVM.salePriceDisplay).foregroundColor(.red)
            Text(plpVM.shortPromoMessage)
        }
    }
}

struct NotOnSale: View {
    let plpVM: PLPViewModel
    
    init(plpVM: PLPViewModel) {
        self.plpVM = plpVM
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(plpVM.name)
            Text(plpVM.listingPriceDisplay)
            Text(plpVM.shortPromoMessage)
        }
    }
}
