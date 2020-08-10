//
//  PLPResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/9/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// observable which does networking and holds the models
class PLPResource {
    // networking
    // with paging
    
    // init with category id
    // immediately fetches first page after push
    // PLP first loads with loading spinner
    // transforms result into view model
    var productViewModels: [PLPViewModel] = []
 
    func fetchProducts() {
        
    }
}
