//
//  ContentView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { ProductListView() }
            .tabItem {
                Image("ShopIcon")
                Text("Shop")
            }
            NavigationView{ MenuView() }
            .tabItem {
                Image("MenuIcon")
                Text("Menu")
            }
            NavigationView{ OrderListView() }
            .tabItem {
                Image("OrderIcon")
                Text("Bill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
