//
//  UserResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// create at top level and add to main stack
// https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec
final class UserResource: ObservableObject {
    var user: User = User()
    
    // possible user states
    
    // updated
    
    
    // not updated, in guest state non-updated "https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec")!)
    let userFetchTaskUnmutated = FetchTask<UserModel>(url: URL(string: "https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec")!)
    
    func onLaunch() {
        userFetchTaskUnmutated.fetchModel()
    }
}

enum GuestState {
    case service
    case local
}
