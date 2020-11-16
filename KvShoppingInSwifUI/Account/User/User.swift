//
//  User.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec

final class User: Identifiable, ObservableObject {
    @Published var id: String = UUID().uuidString
    @Published var isLoggedIn: Bool = false
}
