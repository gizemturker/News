//
//  CategoryPickerView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct CategoryPickerView: View {
    @Binding var selectedCategory: Category
    let categories: [Category]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    CategoryItemView(category: category, isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding()
        }
    }
}
