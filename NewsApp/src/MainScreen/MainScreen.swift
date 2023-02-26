//
//  MainScreen.swift
//  NewsApp
//
//  Created by Александр Фатеев on 16.02.2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var mainScreenVM = MainScreenViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                ScrollView(.vertical) {
                    ZStack {
                        if mainScreenVM.loading {
                            HStack {
                                ProgressView().tint(.white)
                            }
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                if mainScreenVM.articles.count > 0 {
                                    ForEach(mainScreenVM.articles) { item in
                                        NavigationLink(destination: DetailScreen(article: item).navigationTitle(item.title), label: {
                                            HeadLinesItem(article: item)
                                        })
                                        .buttonStyle(.plain)
                                        .transition(AnyTransition.scale.animation(.spring()))
                                    }
                                }
                            }.padding(.horizontal, 10)
                        }
                    }
                    VStack {
                        SearchCategoryButtons().padding(.vertical, 20)
                        if mainScreenVM.articles.count > 0 {
                            ForEach(mainScreenVM.articles) { item in
                                NavigationLink(destination: DetailScreen(article: item).navigationTitle(item.title), label: {
                                    SmallNewsItem()
                                })
                                .buttonStyle(.plain)
                                .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.4)))
                            }
                        }
                    }.padding(.horizontal, 10)
                }
            }
            .padding(.top, 30)
            .onAppear {
                Task {
                    await mainScreenVM.getTopHeadlines()
                }
            }
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
