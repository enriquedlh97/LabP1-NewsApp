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
    // Completion handler to be excecuted when data is gotten. Provides Weathe robject when the function is called
    private var completionHandler: ((Weather) -> Void)?
    
    // Gets user location
    public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // Gets weather data for above gotten location
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            // Decod data if previous block successful
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
            }
        }.resume()
    }
}


//These 3 structures represent the JSON response from the API

// Struct to represent the complete reponse of the API
struct APIResponse: Decodable {
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
