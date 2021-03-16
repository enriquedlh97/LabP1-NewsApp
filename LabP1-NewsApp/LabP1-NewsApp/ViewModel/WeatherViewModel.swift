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
}
