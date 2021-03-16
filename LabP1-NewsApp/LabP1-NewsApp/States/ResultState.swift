//
//  ResultState.swift
//  LabP1-NewsApp
//
//

import Foundation

// Three states included to change the view depending ont he state
enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
