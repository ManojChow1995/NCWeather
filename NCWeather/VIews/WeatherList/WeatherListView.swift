//
//  WeatherListView.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject var weatherListViewModel = WeatherListViewModel()
    
    var body: some View {
        NavigationStack {
            List(weatherListViewModel.weatherDataCollection) {weatherData in
                WeatherListCellView(weatherData: weatherData)
            }
            .onAppear{weatherListViewModel.getWeatherData()}
            .navigationTitle("Weather")
        }
    }
}

#Preview {
    WeatherListView()
}
