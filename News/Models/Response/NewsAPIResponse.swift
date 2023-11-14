//
//  NewsAPIResponse.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
