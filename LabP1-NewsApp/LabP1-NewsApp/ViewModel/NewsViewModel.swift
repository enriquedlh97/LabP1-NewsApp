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
    
    // Uses enum with result states to push the current state to the front end. The default value is ".loading"
    // "@Published" Allows to listen when the variable "state" changes.
    @Published private(set) var state: ResultState = .loading
    
    // Injected news service into the class (basic start of the request).
    // Essentially a Dependency injection
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        // Calls service to trigger API call
        
        // Uses above created service to call the request fucntion
        let cancellable = service
            .request(from: .getNews)
            // Allows to listen to completion (either success or failure) and to listen to
            // when it is finished publishing
            .sink { res in
                // Listen to the result and decide what to do based on it
                switch res {
                case .finished:
                    // Send back the articles
                case .failure(<#T##APIError#>):
                    // Send back the errors
                }
            } receiveValue: { (response) in
                // When the value from the request is gotten then we have to put the articles in the articles
                // array
                self.articles = response.articles
            }
    }
}
