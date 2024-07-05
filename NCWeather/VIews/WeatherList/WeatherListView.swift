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
            
            Picker("Picker",
                   selection: $weatherListViewModel.selectedSortOption,
                   content:{
                        Text("A-Z").tag(SortOptions.alphabetical)
                        Text("Temperature").tag(SortOptions.temperature)
                        Text("Last Updated").tag(SortOptions.lastUpdated)
            }).padding()
                .pickerStyle(.segmented)
                .onChange(of: weatherListViewModel.selectedSortOption) { _, _ in
                    weatherListViewModel.updateList()
                }

            List(weatherListViewModel.weatherDataCollection) {weatherData in
                WeatherListCellView(weatherData: weatherData)
            }
            .onAppear{weatherListViewModel.getWeatherData()}
            .navigationTitle("Weather")
            
            Picker("Filter",
                   selection: $weatherListViewModel.selectedFilter,
                   content:{
                        Text("All Countries").tag("All")
                        ForEach(weatherListViewModel.countries) { country in
                        Text("\(country.name)").tag(country.id)
                        }
            }).padding()
                .pickerStyle(.navigationLink)
                .onChange(of: weatherListViewModel.selectedFilter) { _, _ in
                    weatherListViewModel.updateList()
                }
        }
    }
}

#Preview {
    WeatherListView()
}
