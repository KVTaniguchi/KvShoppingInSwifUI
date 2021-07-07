//
//  ShoppingBrowse.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/1/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import SwiftUI

struct ShoppingBrowse: View {
    @State private var showingCart = false
    @State private var isSearching = false
    @State private var searchTitle = "Search"
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SearchView()) {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search")
                    }
                }
                NavigationLink(
                    destination: PLPView()
                ) {
                    Text("Thing")
                }
                NavigationLink(
                    destination: PLPView()
                ) {
                    Text("more")
                }
            }.navigationBarTitle("shopping", displayMode: .automatic)
            .navigationBarItems(trailing:
                Button(
                    action: {
                        self.showingCart.toggle()
                    }) {
                        Image(systemName: "cart").imageScale(.large)
                    }
            )
            .sheet(isPresented: $showingCart) {
                CartView()
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            SearchBar()
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
            .searchable(text: $searchText)
            .navigationTitle("Searchable Example")
        }
    }
}
