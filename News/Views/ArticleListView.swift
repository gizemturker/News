//
//  ArticleListView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct ArticleListView: View {
    let source: Source
    @StateObject var articleVM = ArticleViewModel()
    @State private var selectedArticle: Article?
    var body: some View {
        List {
            ForEach(articleVM.articles) { article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top:0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .task {
            await articleVM.loadArticles(source: source.id)
        }
    }
}



