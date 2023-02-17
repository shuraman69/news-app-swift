//
//  HeadLinesItem.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import SwiftUI

struct HeadLinesItem: View {
    let article: Article
    let gradientStartColor = getColor(hexColor: PrimaryColorHex, alpha: 0.3)!
    let gradientStopColor = getColor(hexColor: PrimaryColorHex, alpha: 0.5)!
    var body: some View {
        
        VStack {
            AsyncImage(
                url: URL(string: "https://random.imagecdn.app/800/500"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit).transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
                },
                placeholder: {
                    VStack {
                        ProgressView()
                    }.frame(height: 220)
                }
            ).clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                Text(article.title).foregroundColor(.white).bold().lineLimit(2)
                Spacer()
            }.padding(.horizontal, 10)
            Spacer()
            
        }
            .frame(width: SIZE.width * 0.9, height: SIZE.height * 0.4)
            .background(LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientStopColor]), startPoint: .bottom, endPoint: .center))
            .cornerRadius(10)
        
    }
}

//struct HeadLinesItem_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadLinesItem()
//    }
//}
