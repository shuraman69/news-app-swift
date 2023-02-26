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

func jsonArticlesToStruct(jsonArticles: [JSON]) -> [Article] {
    var result: [Article] = []
    for item in jsonArticles {
        let title = item["title"].stringValue
        let sourceName = item["source"]["name"].stringValue
        let author = item["author"].stringValue
        let description = item["description"].stringValue
        let publishedAt = item["publishedAt"].stringValue
        let urlToImage = item["urlToImage"].stringValue
        result.append(Article(title: title, sourceName: sourceName, author: author, description: description, publishedAt: publishedAt, urlToImage: urlToImage))
    }
    return result
}

@MainActor
class MainScreenViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var loading = false
    private let API = NewsApi(url: "https://newsapi.org/v2/top-headlines?country=ru")
    public func getTopHeadlines() async {
        loading = true
        let result = await getData()
        self.articles = result
        loading = false
    }
    private func getData() async -> [Article] {
        let data = await API.getData()
        let articlesList = data["articles"].arrayValue
        return jsonArticlesToStruct(jsonArticles: articlesList)
    }
}
