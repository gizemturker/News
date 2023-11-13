//
//  CategoryPickerView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct CategoryPickerView: View {
    @StateObject var sourceVM: SourceViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                ForEach(Category.allCases) { category in
                    CategoryItemView(category: category, isSelected: category == sourceVM.selectedCategory)
                        .onTapGesture {
                            Task {
                                await sourceVM.setSelectedCategory(category: category)
                                await sourceVM.loadSources(category: category)
                            }
                        }
                }
            }	
            .padding()
        }
    }
}
