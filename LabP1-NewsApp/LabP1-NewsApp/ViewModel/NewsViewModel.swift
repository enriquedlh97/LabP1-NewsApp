//
//  NewsViewModel.swift
//  LabP1-NewsApp
//
//

import Foundation
import Combine

protocol  NewsViewModel {
    func getArticles()
}


// Class as observable object that implements the above protocol
// Observable object is used to observe the changes in the class
class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    // Injected news service into the class (basic start of the request).
    // Essentially a Dependency injection
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        <#code#>
    }
}
