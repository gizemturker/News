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
    private let newsAPI = NewsAPI.shared
    func loadSources(category: Category) async {
        do {
            self.sources = try await newsAPI.fetchSources(url: newsAPI.fetchSourcesURL(category: category.rawValue))
            
        } catch {
            print(error.localizedDescription)
        }
    
    }

    }
