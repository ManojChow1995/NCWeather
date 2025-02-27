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
                Text(weatherData.weatherCondition ?? "NA")
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("\(weatherData.weatherTemp ?? "NA")°")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.cyan)
        }.padding(.vertical)
    }
}

#Preview {
    WeatherListCellView(weatherData: WeatherData(id: "1234", name: "City Name", country: Country(id: "5633", name: "Country Name"), weatherCondition: "Weather Condition", weatherWind: "", weatherHumidity: "", weatherTemp: "10", weatherFeelsLike: "", weatherLastUpdated: nil))
}
