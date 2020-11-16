//
//  CartResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

final class CartResource: ObservableObject {
    // local cart vs service cart
    // local cart has a time to live
    // once time to live expires it is 
    
    private var fetchedCart: CartModel?
    
    func load() {
        
    }
}
