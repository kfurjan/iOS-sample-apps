//
//  Weather.swift
//  WeatherApp
//
//  Created by itrainer006 on 01/10/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
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
