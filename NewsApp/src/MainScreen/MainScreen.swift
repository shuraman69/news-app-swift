//
//  MainScreen.swift
//  NewsApp
//
//  Created by Александр Фатеев on 16.02.2023.
//

import SwiftUI
struct Item: Identifiable  {
    let id = UUID()
    let text: String
}

struct MainScreen: View {
    let list = [Item(text: "1"), Item(text: "1")]
    @StateObject private var mainScreenVM = MainScreenViewModel()
    var body: some View {
        VStack(alignment: .trailing) {
            SearchBar().padding(.horizontal, 20)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    if mainScreenVM.articles.count > 0 {
                        ForEach(mainScreenVM.articles) { item in
                            ListItem(text: item.title)
                        }
                    } else {
                        ProgressView()
                    }

                }
            }
            Spacer()
        }.onAppear {
            mainScreenVM.getTopHeadlines()
        }
    }
}

struct ListItem: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
        }
    }
}
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
