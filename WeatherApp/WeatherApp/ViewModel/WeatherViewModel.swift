//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by itrainer006 on 01/10/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var data: [Weather] = []
    private var cancellable: AnyCancellable?
    
    func retrieveData() {
        guard let url = URL(string: "http://demo0745307.mockable.io/weather") else {
            return
        }
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: [Weather].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) }, receiveValue: { self.data = $0 })
    }
}
