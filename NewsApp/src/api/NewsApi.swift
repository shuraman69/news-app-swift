//
//  NewsApi.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import Foundation
import SwiftyJSON
struct A {
    let id: String
}

class NewsApi {
    var url: String = ""
    let API_KEY = "a9fa41b0dbf243698caa0ca481aad248"
    init(url: String) {
        self.url = url
    }
    func getData() async -> JSON {
        var request = URLRequest(url: URL(string: self.url)!)
        request.httpMethod = "GET"
        request.addValue(self.API_KEY, forHTTPHeaderField: "Authorization")
        let (data) = try! await URLSession.shared.data(for: request)

        let jsonData1 = try! JSON(data: data.0)
        return jsonData1
    }
}
