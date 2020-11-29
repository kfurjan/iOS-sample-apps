//
//  Article.swift
//  NewsApp
//
//  Created by Kevin Furjan on 02/10/2020.
//  Copyright © 2020 kfurjan. All rights reserved.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID() 
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL?
    let publishedAt: Date
    let content: String?
}
