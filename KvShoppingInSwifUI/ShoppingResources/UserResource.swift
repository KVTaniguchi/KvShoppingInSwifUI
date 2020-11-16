//
//  UserResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// create at top level and add to main stack
final class UserResource: ObservableObject {
    var user: User = User()
    
    // possible user states
    
    // updated
    
    
    // not updated, in guest state non-updated
    //
    
    func load() {
        // hit network and update user
    }
}

enum GuestState {
    case service
    case local
}
