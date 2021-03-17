//
//  HomeView.swift
//  LabP1-NewsApp
//
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
        FeedView()
            .tabItem {
                Image(systemName: "newspaper")
                Text("Feed")
            }
            
            // Provide viewModel to Weatherview which is necesary to get data to be displayed
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
        WeatherView(viewModel: viewModel)
            .tabItem {
                Image(systemName: "cloud.sun")
                Text("Weather")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
