//
//  CategoryItemView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct CategoryItemView: View {
    let category: Category
    let isSelected: Bool

    var body: some View {
        Text(category.rawValue.capitalized)
            .font(.headline)
            .foregroundColor(isSelected ? .white : .black)
            .frame(width: 120, height: 40)
            .background(isSelected ? Color.black : Color.gray)
            .cornerRadius(10)
            .padding(5)
    }
}

