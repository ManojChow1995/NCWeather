//
//  WeatherDetailViewModel.swift
//  NCWeather
//
//  Created by ManChow on 6/7/2024.
//

import Foundation

final class WeatherDetailViewModel: ObservableObject {
    
    @Published var weatherData: WeatherData
    @Published var formattedHumidityString:String = ""
    @Published var formattedWindString = ""
    @Published var formattedDateString = ""
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        
        self.formattedHumidityString = weatherData.weatherHumidity?.replacingOccurrences(of: "Humidity: ", with: "") ?? "NA"
        self.formattedWindString = weatherData.weatherWind?.replacingOccurrences(of: "Wind: ", with: "") ?? "NA"
        self.formattedDateString = "Last updated on \(weatherData.weatherLastUpdated?.formatted(date: .long, time: .standard) ?? "NA")"
    }
}
