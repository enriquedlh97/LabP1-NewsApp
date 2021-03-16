//
//  APIError.swift
//  LabP1-NewsApp
//
//

import Foundation

enum APIError {
    // Occurs when object fails to be called, ei. JSON structure changes, etc.
    case decodingError
    // Provides error code
    case errorCode(Int)
    // Handles any other error
    case unknown
}

// Adds description to the errors above as an extension
extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Service object decoding was unsuccessful"
        case .errorCode(let code):
            return "\(code): Error"
        case .unknown:
            return "Uknown error"
        }
    }
}
