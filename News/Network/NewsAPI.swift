//
//  NewsAPI.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "f278f35353104b3293ca675d1dfccf4d"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetchArticles(url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
  
        
        switch response.statusCode {
            
        case 200:
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)

            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    func fetchSources(url: URL) async throws -> [Source] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
            
        case 200:
            let apiResponse = try jsonDecoder.decode(SourcesAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.sources ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
     func fetchTopHeadlines(url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
            
        case 200:
            let apiResponse = try jsonDecoder.decode(TopHeadlineAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
     func fetchArticlesURL(source:String) -> URL {
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&sources=\(source)"
        return URL(string: url)!
    }
    
     func fetchSourcesURL(category:String) -> URL {
        var url = "https://newsapi.org/v2/top-headlines/sources?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category)"
        return URL(string: url)!
    }
    
     func fetchTopHeadlineURL(source: String) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&pageSize=3"
        url += "&sources=\(source)"
        return URL(string: url)!
    }
}

