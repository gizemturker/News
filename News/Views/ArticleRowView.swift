//
//  ArticleRowView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Gizem Turker on 11.11.2023.
//

import SwiftUI

struct ArticleRowView: View {
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: article.urlToImage!)) {
                phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                @unknown default:
                    fatalError()
                }
            }
//            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                LabelText(text: article.title)
                DescText(text: article.description ?? "")
                    .lineLimit(1)
                HStack{
                
                    Spacer()
                    
                    Button{
                        //
                    } label: {
                        Image(systemName: "bookmark")
                    }
                    .buttonStyle(.bordered)
                    
                    Button{
                        presentShareSheet(url: URL(string: article.url)!)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(.bordered)
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
    
    private func updateBookmarkStatus(for article: Article) {
        if bookmarkVM.hasBookmark(for: article) {
            bookmarkVM.removeBookmark(for: article)
        } else {
            bookmarkVM.addBookmark(for: article)
        }
    }
    
}

extension View {
    func presentShareSheet(url:URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    @StateObject static var bookmarkVM = BookmarkViewModel.shared
    static var previews: some View {
        
        NavigationView {
            List {
                ArticleRowView(article: .previewData)
                    .listRowInsets(.init(top:0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
        .environmentObject(bookmarkVM)
     
    }
       
}
