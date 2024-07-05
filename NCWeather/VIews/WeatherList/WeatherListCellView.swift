//
//  WeatherListCellView.swift
//  NCWeather
//
//  Created by ManChow on 5/7/2024.
//

import SwiftUI

struct WeatherListCellView: View {
    let weatherData: WeatherData
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(weatherData.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(weatherData.weatherCondition ?? "")
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("\(weatherData.weatherTemp ?? "")°")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.cyan)
        }.padding()
    }
}

#Preview {
    WeatherListCellView(weatherData: WeatherData(id: "1234", name: "City Name", country: Country(countryID: "5633", name: "Country Name"), weatherCondition: "Weather Condition", weatherWind: "", weatherHumidity: "", weatherTemp: "10", weatherFeelsLike: "", weatherLastUpdated: nil))
}
