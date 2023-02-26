//
//  HeadLinesItem.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import SwiftUI
import SkeletonUI
struct HeadLinesItem: View {
        let article: Article
    @State var loading = true
    let gradientStartColor = getColor(hexColor: PrimaryColorHex, alpha: 0.4)!
    let gradientStopColor = getColor(hexColor: PrimaryColorHex, alpha: 0.7)!
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(
                    url: getImageUrl(url: article.urlToImage),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill).transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4))).frame(maxWidth: .infinity, maxHeight: 200)
                    },
                    placeholder: {
                        if(article.urlToImage.isEmpty) {
                            Image(systemName: "globe")
                        } else {
                            VStack {}.skeleton(with: true).shape(type: .rectangle)
                        }
                            
                    }
                ).clipShape(RoundedRectangle(cornerRadius: 10))
            }.frame(maxWidth: 500, maxHeight: 200)
            VStack(alignment: .leading) {
                Text(article.title).foregroundColor(.white).bold().lineLimit(article.description.isEmpty ? 2 : 4)
                Text(article.description).foregroundColor(.white).lineLimit(3)
            }.padding(.horizontal, 10)
            Spacer()
        }
        .frame(width: SIZE.width * 0.9, height: SIZE.height * 0.4)
        .background(LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientStopColor]), startPoint: .bottom, endPoint: .center))
        .cornerRadius(10)
        
    }
}
//
//struct HeadLinesItem_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadLinesItem()
//    }
//}
