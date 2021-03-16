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
    
    // (set) allows the variable to be protected but still accesable outside the class
    // This array holds the news articles
    private(set) var articles = [Article]()
    // Will hold the requestsin memory to avoid getting disposed of the service when calling it
    private var cancellables = Set<AnyCancellable>()
    
    // Injected news service into the class (basic start of the request).
    // Essentially a Dependency injection
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        <#code#>
    }
}
