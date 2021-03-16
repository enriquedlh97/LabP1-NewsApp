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
