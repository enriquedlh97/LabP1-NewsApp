//
//  NewsEndpoint.swift
//  LabP1-NewsApp
//
//

import Foundation

// Written as protocol to be reusable
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum  NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    // Generates path to call the API (Endpoint)
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    // API base url webstie
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    // API resource path to be accesed
    var path: String {
        return "/news"
    }
    
    
}
