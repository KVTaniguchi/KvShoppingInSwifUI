//
//  CartModel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/22/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// local vs service
// do we even have an app without a network? not reallly

struct CartModel: Codable, Identifiable {
    let id: String
    
    // items grouped by fulfillment method
    let items: [CartItem]

    // no order summary - that is calculated at checkout
    
    // this should be a fast and cheap call to get a list of products
    // in the users cart
    // e-com takes place in checkout
}

// shipping - 3rd party, 1st party, in garage, locker
// shopper direct to door (prime now, shipt, instacart)
// store pickup (can be curb or in store, both the same)
struct Fulfillment: Codable, Identifiable {
    let id: String
}

struct CartItem: Codable {
    let title: String
    var quantity: Int
    let imageURL: URL?
    
    // handle all money in int penny
    let costPerUnit: Int
    let originalCostPerUnit: Int?
    
    var availableDiscounts: [Discount]
}

// display only, actual discount is applied in service
struct Discount: Codable {
    let title: String
    let value: String
    let isApplied: Bool
}

struct OrderSummary: Codable {
    let finalTotal: Int
    let tax: Int
    let discountTotal: Int
    let itemTotal: Int
}
