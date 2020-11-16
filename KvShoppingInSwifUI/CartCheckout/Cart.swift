//
//  Cart.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/10/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation
import Combine

// theory of cart
// it is an environment object of this shopping experience
// it handles cart updates and publishes across the app
// it is authorized at the beginning
// its source of truth is the service
// UI is the input

final class Cart: ObservableObject {
    var cart: CartModel?
}
