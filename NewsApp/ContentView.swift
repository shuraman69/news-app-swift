//
//  ContentView.swift
//  NewsApp
//
//  Created by Александр Фатеев on 16.02.2023.
//

import SwiftUI
import Inject
struct ContentView: View {
    @ObserveInjection var inject
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
//            MainScreen()
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Favorite")
//                }
//            MainScreen()
//                .tabItem {
//                    Image(systemName: "basket")
//                    Text("Profile")
//                }
        }.accentColor(PrimaryColor).enableInjection()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
