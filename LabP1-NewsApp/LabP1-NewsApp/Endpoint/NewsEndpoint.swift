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
    var urlRequest: URLRequest {
        <#code#>
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}
