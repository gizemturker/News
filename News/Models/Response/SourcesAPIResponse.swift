//
//  SourcesAPIResponse.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct SourcesAPIResponse: Decodable {
    let status: String
    let sources: [Source]?

    let code: String?
    let message: String?
}
