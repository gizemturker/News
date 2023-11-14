//
//  BookmarkViewModel.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

@MainActor
class BookmarkViewModel: ObservableObject {
    @StateObject var articleVM = ArticleViewModel()
    @Published private(set) var bookmarks: [Article] = []
    private let bookmarkData = PlistDataRepository<[Article]>(filename: "bookmarks")
    
    static let shared = BookmarkViewModel()
    private init() {
        Task {
            await load()
        }
    }
    
    private func load() async {
        bookmarks = await bookmarkData.load() ?? []
    }
    
    func hasBookmark(for article: Article) -> Bool {
        return bookmarks.first { article.id == $0.id } != nil
    }

    func addBookmark(for article: Article) {
        guard !hasBookmark(for: article) else {
            return
        }

        bookmarks.insert(article, at: 0)
        updateBookmark()
    }
    
    func removeBookmark(for article: Article) {
        guard let index = bookmarks.firstIndex(where: { $0.id == article.id }) else {
            return
        }
        bookmarks.remove(at: index)
        updateBookmark()
      
    }
    
    private func updateBookmark() {
        let bookmarks = self.bookmarks
        Task {
            await bookmarkData.save(bookmarks)
        }
    }

}

