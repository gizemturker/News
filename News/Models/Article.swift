//
//  Article.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct Article: Codable, Identifiable, Equatable {
    
    let id = UUID()
    let source: ArticleSource
    let title: String
    let url: String
    let publishedAt: Date
    let author: String?
    let description: String?
    let urlToImage: String?
    let content: String
    
    struct ArticleSource: Codable {
         let id: String?
         let name: String
     }
    
    enum CodingKeys: String, CodingKey{
        case id
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
        case content
    }

    
}



extension Article {
    static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
    static let previewData = Article(
         source: ArticleSource(
            id: "", name: "BBC"
        ),
        title: "meta",
        url: "nil",
        publishedAt: Date(),
        author: "",
        description: "",
        urlToImage: "",
    content: "")
}
