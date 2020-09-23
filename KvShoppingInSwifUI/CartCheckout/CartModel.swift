//
//  CartModel.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 9/22/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

struct CartModel: Codable {
    let id: String
    
    struct Item {
        let title: String
        
    }
    
    let items: [Item]
}
