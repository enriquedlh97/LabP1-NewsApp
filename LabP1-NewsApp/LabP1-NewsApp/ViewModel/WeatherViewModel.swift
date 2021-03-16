//
//  WeatherViewModel.swift
//  LabP1-NewsApp
//
//

import Foundation

private let defaultIcon = " ❓ "
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain": "🌧",
    "Snow": "🌨",
    "Clear": "☀️",
    "Clouds": "☁️",
]

// Gets data from service and converts model to the info that the view needs to be displayed in the app
public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    // Used to get the weather data
    public let weatherService: WeatherService
    
    // Get weatherService when the viewModel is initialized
    public init(weatherService: WeatherService) {
        // asign the weatherService property
        self.weatherService = weatherService
    }
     
    // Calls the weatherService method above to load data and then update @Published properties for the view to display
    public func refresh() {
        weatherService.loadWeatherData { weather in
            // Update properties. Use DispatchQueue since they update the ui and they have to be updated in the mai Queue
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
