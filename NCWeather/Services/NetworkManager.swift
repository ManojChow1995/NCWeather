//
//  NetworkManager.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import Foundation

enum NCWError: Error {
    case invalidURL
    case invalidResponse
    case decodeFailure
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let urlString = "https://dnu5embx6omws.cloudfront.net/venues/weather.json"
    
    private init() {
    }
    
    func fetchWeatherData() async throws -> [WeatherData]{
        guard let url = URL(string: urlString) else {
            throw NCWError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
    
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NCWError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(WeatherDataResponse.self, from: data)
            return decodedData.data
        } catch {
            throw NCWError.decodeFailure
        }
    }
}

