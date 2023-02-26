//
//  SearchBarViewModel.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import Foundation

class SearchBarViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var articles: [Article] = []
    let API = NewsApi(url: "https://newsapi.org/v2/everything")
    func onSubmit() async {
        let jsonData = await API.getData(query: "?q=\(value)")
        let articlesList = jsonData["articles"].arrayValue
        print(jsonData)
        let result = jsonArticlesToStruct(jsonArticles: articlesList)
        self.articles = result
    }
}

