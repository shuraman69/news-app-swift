//
//  DetailScreen.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import SwiftUI

struct DetailScreen: View {
    var article: Article
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AsyncImage(
                    url: URL(string: article.urlToImage),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit).transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
                    },
                    placeholder: {
                        VStack(alignment: .center) {
                            ProgressView()
                        }.frame(height: 220)
                    }
                )
            }
            ScrollView {
                VStack(alignment: .leading) {
                    Text(article.title).bold().font(.largeTitle).padding(.bottom, 10)
                    Text(article.description)
                }.padding(.horizontal, 20)
            }
        }.ignoresSafeArea()
    }
}
//
//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}
