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
        WeatherView()
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
