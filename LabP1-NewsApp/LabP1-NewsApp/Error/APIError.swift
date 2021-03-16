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
