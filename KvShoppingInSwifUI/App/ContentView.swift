//
//  ContentView.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Int = 0
    
    var body: some View {
        TabView(selection: $activeTab) {
            ShoppingBrowse()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Shop")
            }.tag(0)
            Account()
            .tabItem {
                Image(systemName: "perspective")
                Text("Account")
            }.tag(1)
        }
    }
}

extension ContentView {
    var activeTabTitle: String {
        switch activeTab {
        case 0:
            return "shop"
        case 1:
            return "account"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
