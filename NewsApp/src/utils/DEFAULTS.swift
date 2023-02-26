//
//  DEFAULTS.swift
//  NewsApp
//
//  Created by Александр Фатеев on 26.02.2023.
//

import Foundation

let DEFAULT_IMAGE_URL = "https://media.istockphoto.com/id/1368264124/photo/extreme-close-up-of-thrashing-emerald-ocean-waves.jpg?b=1&s=170667a&w=0&k=20&c=qha_PaU54cu9QCu1UTlORP4-sW0MqLGERkdFKmC06lI="
func getImageUrl(url: String) -> URL? {
    if(url.isEmpty) {
        return URL(string: DEFAULT_IMAGE_URL)
    }else {
        return URL(string: url)
    }
}
