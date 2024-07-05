//
//  WeatherListViewModel.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import Foundation

@MainActor final class WeatherListViewModel: ObservableObject {
    
    @Published var weatherDataCollection:[WeatherData] = []
    
    func getWeatherData() {
        Task {
            do {
                let unfilteredDataCollection =  try await NetworkManager.shared.fetchWeatherData()
                weatherDataCollection = unfilteredDataCollection.filter { weatherData in
                    if let _ = weatherData.weatherCondition {
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
}
