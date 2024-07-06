//
//  WeatherDetailView.swift
//  NCWeather
//
//  Created by ManChow on 6/7/2024.
//

import SwiftUI

struct WeatherDetailView: View {
    let weatherDetailViewModel: WeatherDetailViewModel

    var body: some View {
        VStack {
            
            HStack{
                VStack(alignment:.leading) {
                    Text(weatherDetailViewModel.weatherData.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(weatherDetailViewModel.weatherData.weatherCondition ?? "NA")
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text("\(weatherDetailViewModel.weatherData.weatherTemp ?? "NA")°")
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundStyle(.cyan)
            }.padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                VStack(alignment:.leading){
                    Text("Feels Like")
                    Text("\(weatherDetailViewModel.weatherData.weatherFeelsLike ?? "NA")°")
                        .foregroundStyle(.cyan)
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Humidity")
                    Text("\(weatherDetailViewModel.formattedHumidityString)")
                        .foregroundStyle(.cyan)
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Wind")
                    Text("\(weatherDetailViewModel.formattedWindString)")
                        .foregroundStyle(.cyan)
                }
            }.padding()
            
            Divider()
                .padding(.horizontal)

            Text("\(weatherDetailViewModel.formattedDateString)")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
        }.padding(.horizontal)
        Spacer()
    }
}

#Preview {
    WeatherDetailView(weatherDetailViewModel: WeatherDetailViewModel(weatherData: WeatherData(id: "1234", name: "City Name", country: Country(id: "5633", name: "Country Name"), weatherCondition: "Weather Condition", weatherWind: "NNW at 20.9kph", weatherHumidity: "71%", weatherTemp: "10", weatherFeelsLike: "5", weatherLastUpdated: Date())))
}
