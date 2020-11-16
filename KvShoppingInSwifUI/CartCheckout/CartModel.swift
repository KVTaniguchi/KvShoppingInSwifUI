//
//  CartModel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/22/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

struct CartModel: Codable, Identifiable {
    let id: String
    
    // items grouped by fulfillment method
    let items: [CartItem]
    
    // applied discounts
    let discounts: [Discount]
    
    // order summary
    let summary: OrderSummary
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
    
    // handle all money in int penny
    let costPerUnit: Int
    
    var availableDiscounts: [Discount]
}

// display only, actual discount is applied in service
struct Discount: Codable {
    let title: String
    let value: String
}

struct OrderSummary: Codable {
    let finalTotal: Int
    let tax: Int
    let discountTotal: Int
    let itemTotal: Int
}
