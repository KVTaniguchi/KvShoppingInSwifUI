//
//  Account.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/30/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI
import Contacts

struct Account: View {
    
    @State private var email: String
    @State private var address: CNPostalAddress
    
    init() {
        _email = State(initialValue: "")
        _address = State(initialValue: CNPostalAddress())
        
        // when do we get user info?
        // on app launch?  most shopping apps would...
        // when do we auth?  how do we auth?
        // what levels of auth do we need?
        // most shopping apps will deal with $
        // and will need some kind of tiered auth
        
        
    }
    
    var body: some View {
        Form {
            Section {
                Text("Email")
            }
            
            Section {
                Text("Shipping Address")
            }
            
            Section {
                Text("Payment")
            }
            
            Section {
                Text("App Settings")
            }
            
            Section {
                Text("Face Id")
            }
        }
    }
}

struct UserProfile {
    let email: String
    let address: CNPostalAddress
}
