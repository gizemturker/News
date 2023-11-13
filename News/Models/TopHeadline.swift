//
//  TopHeadline.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct TopHeadline: Codable, Hashable {
    let source: Source

    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}





