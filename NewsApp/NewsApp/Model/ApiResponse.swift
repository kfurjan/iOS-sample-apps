//
//  ApiResponse.swift
//  NewsApp
//
//  Created by Kevin Furjan on 02/10/2020.
//  Copyright © 2020 kfurjan. All rights reserved.
//

import Foundation

struct ApiResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
