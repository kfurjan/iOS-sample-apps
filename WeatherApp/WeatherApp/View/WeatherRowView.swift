//
//  WeatherRowView.swift
//  WeatherApp
//
//  Created by Kevin Furjan on 01/10/2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI

struct WeatherRowView: View {
    var weather: Weather
    let temperatureUnit = "°C"
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: weather.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(weather.city)
                    .font(.title)
                Text(weather.message)
                    .font(.headline)
            }
            
            Spacer()
            
            Text("\(weather.temperature.description) \(temperatureUnit)")
                .font(.headline)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(radius: 4)
        )
    }
}

struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(weather: Weather(id: 1, city: "Varaždin", temperature: 25.4, icon: "sun.max", message: "Sunny", forecast: [16, 17.3, 24, 8, 3, 5, 9.3]))
    }
}
