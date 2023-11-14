//
//  SourceListView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

// SourceListView.swift
import SwiftUI

struct SourceListView: View {
    @StateObject var sourceVM = SourceViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    CategoryPickerView(sourceVM: sourceVM)
                }
                .frame(height: 90)
                
                // List
                List {
                    ForEach(sourceVM.sources) { source in
                        NavigationLink(destination: ArticleListView(source: source)) {
                            SourceRowView(source: source)
                        }
                    }
                }
                .onAppear {
                    Task {
                        await sourceVM.loadSources(category: sourceVM.selectedCategory)
                    }
                }
            }
            .navigationBarTitle("Sources")
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(
                            Color.blue,
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}


