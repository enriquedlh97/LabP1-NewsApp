//
//  WeatherView.swift
//  LabP1-NewsApp
//
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,Color("Weather2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text(viewModel.cityName)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 120)
                    .padding(.top,50)
                
                VStack {
                    //Image(systemName: "cloud.drizzle.fill")
                    Image(systemName: viewModel.weatherIcon)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                VStack {
                    Text(viewModel.temperature)
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                        .bold()
                }
                VStack {
                    Text(viewModel.weatherDescription)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
                Spacer()
            }
        }.onAppear(perform: viewModel.refresh)
    } // Makes sure the ViewmOdel is reshreshed when the view appears
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
