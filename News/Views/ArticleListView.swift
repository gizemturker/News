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
    @State private var sliderOffset: CGFloat = 0 // Track the offset for SliderView

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                VStack {
                    SliderView(articles: articleVM.headlines)
                }
                .padding()
                GeometryReader { geometry in
                    List {
                        ForEach(articleVM.articles) { article in
                            ArticleRowView(article: article)
                                .onTapGesture {
                                    selectedArticle = article
                                }
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .sheet(item: $selectedArticle) {
                        SafariWebView(url: $0.articleURL)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                    .overlay(
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            Color.clear
                                .onAppear {
                                    sliderOffset = minY < 0 ? 0 : -minY
                                }
                        }
                        , alignment: .top
                    )
                }
            }
            .task {
                await articleVM.loadArticles(source: source.id)
            }
        }
        .navigationTitle(source.name)
    }
}
