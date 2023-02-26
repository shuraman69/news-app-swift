//
//  SmallNewsItem.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import SwiftUI

struct SmallNewsItem: View {
    let CARD_MAX_HEIGHT = 200 as CGFloat
//    let article: Article
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(
                    url: getImageUrl(url: ""),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill).transition(AnyTransition.opacity.animation(.spring())).frame(maxWidth: .infinity, maxHeight: CARD_MAX_HEIGHT)
                    },
                    placeholder: {
                        VStack {}.frame(height: CARD_MAX_HEIGHT).skeleton(with: true).shape(type: .rectangle)
                    }
                ).overlay(VStack{}.frame(width: SIZE.width, height: CARD_MAX_HEIGHT).background(.black)).opacity(0.5).clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("lorer lorem lorem lorer lorem loremlorer lorem loremlorer lorem loremlorer").foregroundColor(.white).bold().lineLimit(2)
                    }
                    Spacer()
                    HStack {
                        Text("lorer lorem").foregroundColor(.white).bold().lineLimit(2)
                        Spacer()
                        Text("lorer lorem").foregroundColor(.white).bold().lineLimit(2)
                    }
                }.padding(10)
            }
        }.frame(maxHeight: CARD_MAX_HEIGHT)
    }
}
//
//struct SmallNewsItem_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallNewsItem()
//    }
//}
