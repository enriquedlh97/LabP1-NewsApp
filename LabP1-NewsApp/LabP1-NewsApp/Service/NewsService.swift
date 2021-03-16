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
                
                // This runs if the response was valid
                // Check if the response falls within the valid codes
                // If it is valid we call the object. If it is not valid we send back an error
                if (200...299).contains(response.statusCode) {
                    // Decode object
                    
                } else {
                    // Returns error with code gotten from the status code
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
