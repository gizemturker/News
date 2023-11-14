//
//  TopHeadlineAPIResponse.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct TopHeadlineAPIResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
