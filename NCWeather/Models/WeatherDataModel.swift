//
//  WeatherDataModel.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import Foundation

struct WeatherData: Decodable, Identifiable {
    let id: String
    let name: String
    let country: Country
    let weatherCondition: String?
    let weatherWind: String?
    let weatherHumidity: String?
    let weatherTemp: String?
    let weatherFeelsLike: String?
    let weatherLastUpdated: Date?
    
    enum CodingKeys: String, CodingKey {
        case id = "_venueID"
        case name =  "_name"
        case country = "_country"
        case weatherCondition = "_weatherCondition"
        case weatherWind = "_weatherWind"
        case weatherHumidity = "_weatherHumidity"
        case weatherTemp = "_weatherTemp"
        case weatherFeelsLike = "_weatherFeelsLike"
        case weatherLastUpdated = "_weatherLastUpdated"
    }
}

struct Country: Decodable, Identifiable, Hashable  {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_countryID"
        case name = "_name"
    }
}

struct WeatherDataResponse: Decodable {
    let data: [WeatherData]
}
