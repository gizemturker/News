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
    
   var text:String {
       if self == .general {
           return "Top Headlines"
       }
    return rawValue.capitalized
  }
}

extension Category: Identifiable {
   var id: Self { self }
}

