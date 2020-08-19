//
//  PLPResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/9/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation
import Combine

struct PLPProduct: Decodable {
    let id: Int
    let name: String
    let listingPrice: Int
    let onSale: Bool
    let salePrice: Int
    let promoMessage: String
    let image: URL
}
