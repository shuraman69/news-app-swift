//
//  SearchBar.swift
//  NewsApp
//
//  Created by Александр Фатеев on 17.02.2023.
//

import SwiftUI

struct SearchBar: View {
    @StateObject private var searchBarVM = SearchBarViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Search...", text: $searchBarVM.value).onSubmit {
                    Task {
                       await searchBarVM.onSubmit()
                    }
                }
                Image(systemName: "magnifyingglass").frame(alignment: .trailing)
            }.padding(.horizontal, 20).padding(.vertical, 10).overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(.black, lineWidth: 1))
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
