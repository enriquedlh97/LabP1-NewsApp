//
//  NewsService.swift
//  LabP1-NewsApp
//
//

import Foundation
import Combine

// Anypublisher allows to subscribe to the event we want to listen to.
// NewsResponse: Success
// APIError: Failure
protocol  NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

// Using a struct to have light weight
struct  NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        
        return URLSession
            .shared
            // Listens to the result of thw service
            .dataTaskPublisher(for: endpoint.urlRequest)
            // We receive on the main thread to avoid having ui out of date
            .receive(on: DispatchQueue.main)
            // Check if there are errors
            .mapError { _ in APIError.unknown}
            // Mange data from response
            .flatMap { data, response -> AnyPublisher<NewsResponse, APIError> in
                // Check if the response was valid
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
