//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Kevin Furjan on 01/10/2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct WeatherDetailView: View {
    var weather: Weather
    
    var body: some View {
        VStack {
            LineView(data: weather.forecast, title: weather.city, legend: "Temperature")
                .padding()
            
            Spacer()
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(weather: Weather(id: 1, city: "Varaždin", temperature: 25.4, icon: "sun.max", message: "Sunny", forecast: [16, 17.3, 24, 8, 3, 5, 9.3]))
    }
}
