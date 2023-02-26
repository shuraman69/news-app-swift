//
//  SearchCategoryButtons.swift
//  NewsApp
//
//  Created by Александр Фатеев on 26.02.2023.
//

import SwiftUI

struct SearchCategoryButton: View {
    let category: String
    let active: Bool
    var body: some View {
        Text(category).padding(10).padding(.horizontal, 15)
            .background(active ? PrimaryColor : .white).cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
        ).foregroundColor(active ? .white : .black)
    }
}
struct Category: Identifiable {
    let title: String
    let id = UUID()
}
struct SearchCategoryButtons: View {
    let filters = [Category(title: "Health"), Category(title: "Sport"), Category(title: "Technology"), Category(title: "Business"), Category(title: "Finance")]
    @State var activeButton = ""
    func onButtonPress(title: String) {
        print("ACTIVATE", title)
        activeButton = title
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters) { category in
                    SearchCategoryButton(category: category.title, active: activeButton == category.title).onTapGesture {
                        onButtonPress(title: category.title)
                    }
                }
            }
        }
        
    }
}

struct SearchCategoryButtons_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryButtons()
    }
}
