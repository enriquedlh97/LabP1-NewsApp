//
//  Weather.swift
//  LabP1-NewsApp
//
//

import Foundation

// The class holds the model data to be used by ViewModel to be shown in UI
public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    // Take response as parameter to initialize weather model
    init(response: APIResponse) {
        // Get data to populate properties from above
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? "" // Provides empty string if not available
        iconName = response.weather.first?.iconName ?? "" // Provides empty string if not available
    }
}
