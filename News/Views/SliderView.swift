//
//  SliderView.swift
//  News
//
//  Created by Gizem Turker on 14.11.2023.
//
import SwiftUI
struct SliderView: View {
    let articles: [Article] // Assuming you have an array of Article models
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(articles) { article in
                    ArticleRowView(article: article)
                        .frame(width: 250) // Adjust the width as needed
                }
            }
            .padding()
        }
    }
}
