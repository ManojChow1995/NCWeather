//
//  WeatherListViewModel.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import Foundation

enum SortOptions {
    case alphabetical
    case temperature
    case lastUpdated
}

@MainActor final class WeatherListViewModel: ObservableObject {
    
    @Published var weatherDataCollection:[WeatherData] = []
    @Published var selectedSortOption:SortOptions = .alphabetical
    
    func getWeatherData() {
        Task {
            do {
                let unfilteredDataCollection =  try await NetworkManager.shared.fetchWeatherData()
                weatherDataCollection = unfilteredDataCollection.filter { weatherData in
                    if let _ = weatherData.weatherCondition, let _ = weatherData.weatherTemp {
                        return true
                    } else {
                        return false
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func updateList() {
        switch selectedSortOption {
        case .alphabetical:
            weatherDataCollection = weatherDataCollection.sorted{$0.name < $1.name}
        case .temperature:
            weatherDataCollection = weatherDataCollection.sorted{Float($0.weatherTemp ?? "") ?? 0 > Float($1.weatherTemp ?? "") ?? 0}
        case .lastUpdated:
            weatherDataCollection = weatherDataCollection.sorted{$0.weatherLastUpdated ?? Date() > $1.weatherLastUpdated ?? Date()}
        }
    }
}
