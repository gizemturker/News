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
                
                // List
                List {
                    ForEach(sourceVM.sources) { source in
                        NavigationLink(destination: ArticleListView(source: source)) {
                            SourceRowView(source: source)
                        }
                    }
                }
                .task {
                    await sourceVM.loadSources(category: Category.general)
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Sources").foregroundColor(.white).background(Color.blue)
          
        }
    }


struct SourceListView_Previews: PreviewProvider {
    static var previews: some View {
        SourceListView()
    }
}
