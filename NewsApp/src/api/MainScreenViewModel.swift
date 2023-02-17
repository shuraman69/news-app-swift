//
//  MainScreenViewModel.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import Foundation
import SwiftyJSON

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let sourceName: String
    let author: String
    let description: String
    let publishedAt: String
    let urlToImage: String
}

class MainScreenViewModel: ObservableObject {
    @Published var articles: [Article] = []
    let API = NewsApi(url: "https://newsapi.org/v2/top-headlines?country=ru")
    public func getTopHeadlines() {
        Task {
            await getData()
        }
    }
    private func getData() async {
        let data = await API.getData()
        let articlesList = data["articles"].arrayValue
        for item in articlesList {
            let title = item["title"].stringValue
            let sourceName = item["source"]["name"].stringValue
            let author = item["author"].stringValue
            let description = item["description"].stringValue
            let publishedAt = item["publishedAt"].stringValue
            let urlToImage = item["urlToImage"].stringValue
            self.articles.append(
                Article(title: title, sourceName: sourceName, author: author, description: description, publishedAt: publishedAt, urlToImage: urlToImage)
            )
        }
    }
}
