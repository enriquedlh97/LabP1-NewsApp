//
//  WeatherService.swift
//  LabP1-NewsApp
//
//

import Foundation
// Allows to get the user's location
import CoreLocation

public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    // Holds API key
    private let API_KEY = "d5faca9c480c18a071c41c9ca3b6a02a"
    // Completion handler to be excecuted when data is gotten
    private var completionHandler: (() -> Void)?
}


//These 3 structures represent the JSON response from the API

// Struct to represent the complete reponse of the API
struct APIResponse {
    // Saves gthe name of the city we are getting the weather for
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

// Used to get the temperature
struct APIMain: Decodable {
    let temp: Double
}

// Used to get the description of weather and the icon to be displayed
struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        // Use the key main to get the value of the iconName from the JSON
        case iconName = "main"
    }
}
