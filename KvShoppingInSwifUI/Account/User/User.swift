//
//  User.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

final class User: Identifiable, ObservableObject {
    @Published var id: String = UUID().uuidString
    @Published var isLoggedIn: Bool = false
    @Published var uodateDate: GuestState = .local
    @Published var userModel: UserModel?
}

struct Loyalty: Codable {
    var isLoyalty: Bool
    var points: Int
}

struct Address: Codable {
    var line1: String
    var line2: String?
    var city: String
    var zipCode: String
    var state: String
}

struct UserModel: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var loyalty: Loyalty
    var addresses: [Address]
    var id: String
}
