//
//  MainScreenViewModel.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import Foundation

struct Article: Identifiable {
    let title: String
    let id = UUID()
}

class MainScreenViewModel: ObservableObject {
    @Published var articles: [Article] = []
    let API = NewsApi(url: "https://newsapi.org/v2/top-headlines?country=us&category=business")
    public func getTopHeadlines() {
        Task {
            await getData()
        }
    }
    private func getData() async {
        let data = await API.getData()
        let articlesList = data["articles"].arrayValue
        for item in articlesList {
            self.articles.append(Article(title: item["title"].stringValue))
        }
    }
}
