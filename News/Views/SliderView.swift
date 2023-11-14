//
//  SliderView.swift
//  News
//
//  Created by Gizem Turker on 14.11.2023.
//
//import SwiftUI
//
//struct SliderView: View {
//    let articles: [Article] // Assuming you have an array of Article models
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 16) {
//                ForEach(articles) { article in
//                    ArticleRowView(article: article)
//                        .frame(width: 250)
//                }
//            }
//            .padding()
//        }
//    }
//}


import SwiftUI

struct SliderView: View {
    let articles: [Article] // Assuming you have an array of Article models
    
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentPage) {
                ForEach(articles.indices, id: \.self) { index in
                        ArticleRowView(article: articles[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)).padding()
            .onChange(of: currentPage) { newIndex in
                // Handle the current page change if needed
                print("Current Page: \(newIndex)")
            }
            Spacer()
        }
        .padding()
    }
}
