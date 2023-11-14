//
//  BookmarkTabView.swift
//  News
//
//  Created by Gizem Turker on 14.11.2023.
//

import SwiftUI

struct BookmarkTabView: View {
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    @EnvironmentObject var articleVM: BookmarkViewModel
    @State var searchText: String = ""
    var body: some View {
        let articles = self.articles
        NavigationView {
//            ArticleListView(source: articleVM.bookmarks)
//                .overlay(overlayView(isEmpty: bookmarkVM.bookmarks.isEmpty))
//                .navigationTitle("Saved Articles")
        }
        .searchable(text: $searchText)
    }
    
    private var articles: [Article] {
        if searchText.isEmpty {
            return bookmarkVM.bookmarks
        }
        return bookmarkVM.bookmarks
            .filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.descriptionText.lowercased().contains(searchText.lowercased())
            }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            PlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}
struct BookmarkTabView_Previews: PreviewProvider {
    @StateObject static var bookmarkVM = BookmarkViewModel.shared
    static var previews: some View {
        BookmarkTabView()
            .environmentObject(bookmarkVM)
    }
}
