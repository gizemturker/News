import SwiftUI

//enum FetchStatus<T> {
//    case empty
//    case success(T)
//    case failure(Error)
//}
//
//struct FetchData: Equatable {
//    var category: Category
//}

@MainActor
class SourceViewModel: ObservableObject {
    @Published var sources: [Source] = []
    @Published var selectedCategory: Category = .general
    private let newsAPI = NewsAPI.shared
    
    func loadSources(category: Category) async {
//        print(category)
        
        do {
            self.sources = try await newsAPI.fetchSources(url: newsAPI.fetchSourcesURL(category: category.rawValue))
            print(sources)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setSelectedCategory(category: Category) async {
        self.selectedCategory = category
    }
    
}
