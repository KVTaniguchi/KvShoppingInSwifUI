//
//  PDPProduct.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/12/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

class PDPFormatter {
    static let formatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
}

struct PDPProduct: Decodable {
    let id: Int
    let name: String
    let listingPrice: Int
    let onSale: Bool
    let promoMessage: String
    let details: String
    let images: [Image]
    
    struct Image: Decodable {
        let value: URL
        let rank: Int
    }
    
    let sizes: [Size]
    
    struct Size: Decodable {
        let value: String
        let rank: Int
    }
    
    let colors: [Color]
    
    struct Color: Decodable {
        let value: String
        let rank: Int
    }
    
    let variations: [Variation]
    
    struct Variation: Decodable {
        let size: String
        let id: Int
        let color: String
        let swatch: String
    }
}

extension PDPProduct {
    var listingPriceString: String? {
        let listingRaw = Decimal(integerLiteral: listingPrice) / 100
        return PDPFormatter.formatter.string(from: NSDecimalNumber(decimal: listingRaw))
    }
}
