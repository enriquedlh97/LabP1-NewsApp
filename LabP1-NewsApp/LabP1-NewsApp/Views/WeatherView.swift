//
//  WeatherView.swift
//  LabP1-NewsApp
//
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            Text("Los Angeles")
                .font(.largeTitle)
                .padding()
            Text("25°C")
                .font(.system(size: 70))
                .bold()
            Text("⛅️")
                .font(.largeTitle)
                .padding()
            Text("Clear Sky")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
