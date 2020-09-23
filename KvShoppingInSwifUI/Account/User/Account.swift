//
//  Account.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/30/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct Account: View {
    var body: some View {
        VStack {
            Text("Email")
            Text("Shipping Address")
            Text("Payment")
            Text("App Settings")
            Text("Face Id")
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
