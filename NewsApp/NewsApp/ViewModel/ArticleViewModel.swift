//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Kevin Furjan on 02/10/2020.
//  Copyright © 2020 kfurjan. All rights reserved.
//

import Foundation
import Combine

class ArticleViewModel: ObservableObject {
    @Published private(set) var data: [Article] = []
    private var cancellable: AnyCancellable?
    
    private let url = "http://newsapi.org/v2/everything?"
    private let apiKey = "26cac70fdacb454697652578c2d71bef"
    
    func getData(searchTerm: String = "world") {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "apiKey", value: apiKey)
         ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: ApiResponse.self, decoder: jsonDecoder)
            .tryMap({ $0.articles })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) }, receiveValue: { self.data = $0 })
    }
}
