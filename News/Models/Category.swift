//
//  Category.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    
    var texttext: String {
        return self == .general ? "Top Headlines" : rawValue.capitalized
    }
}

extension Category: Identifiable {
   var id: Self { self }
}

