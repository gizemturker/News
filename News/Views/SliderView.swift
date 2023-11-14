
import SwiftUI

struct SliderView: View {
    let articles: [Article]
    @State private var currentPage = 0
    
    var body: some View {
        HStack(spacing:0) {
            TabView(selection: $currentPage) {
                ForEach(articles.indices, id: \.self) { index in
                        ArticleRowView(article: articles[index])
                        .tag(index)
                }
            }
            .padding(.all,10)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onChange(of: currentPage) { newIndex in
                // Handle the current page
                print("Current Page: \(newIndex)")
            }
            Spacer()
        }
    }
}





