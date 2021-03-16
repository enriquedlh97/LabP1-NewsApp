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
