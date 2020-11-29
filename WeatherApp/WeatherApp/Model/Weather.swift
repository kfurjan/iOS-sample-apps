//
//  Weather.swift
//  WeatherApp
//
//  Created by Kevin Furjan on 01/10/2020.
//  Copyright © 2020. All rights reserved.
//

import Foundation

struct Weather: Identifiable, Codable {
    var id: Int
    var city: String
    var temperature: Double
    var icon: String
    var message: String
    var forecast: [Double]
}
