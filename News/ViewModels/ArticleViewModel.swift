//
//  ArticleViewModel.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

@MainActor
class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var headlines: [Article] = []
    private let newsAPI = NewsAPI.shared
    func loadArticles(source: String) async {
    
        do {
            self.articles = try await newsAPI.fetchArticles(url: newsAPI.fetchArticlesURL(source: source))
        } catch {
            print(error.localizedDescription)
        }
        do {
            self.headlines = try await newsAPI.fetchTopHeadlines(url: newsAPI.fetchTopHeadlineURL(source: source))
           
        } catch {
            print(error.localizedDescription)
        }
    
    }

    }
