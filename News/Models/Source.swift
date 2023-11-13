//
//  Source.swift
//  NewsApp
//
//  Created by Gizem Turker on 12.11.2023.
//

import Foundation

struct Source: Codable, Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String?
    let language: String?
    let country: String?
    
    
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case description
      case url
      case category
      case language
      case country 
    }
}

extension Source {
    static let previewData = Source(
        id: "", name: "BBC", description: "BBC News", url: "nil", category: "business", language: "en", country: "us"
    )
}
