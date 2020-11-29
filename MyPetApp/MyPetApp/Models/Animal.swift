//
//  Animal.swift
//  MyPetApp
//
//  Created by itrainer006 on 29/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import Foundation
import Combine

enum AnimalType: String, Codable {
    case dog
    case cat
    case bird
    case snake
}

struct Animal: Identifiable, Codable {
    var id = UUID()
    let name: String
    let imageUrl: String
    let years: Int
    let vaccinated: Bool
    let animalType: AnimalType
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case years
        case vaccinated
        case animalType
    }
}

class AnimalViewModel: ObservableObject {
    @Published var data: [Animal] = []
    private var cancellable: AnyCancellable?
    
    func retrieveData() -> Void {
        guard let url = URL(string: "http://demo0745307.mockable.io/animals") else { return }
        
        cancellable = URLSession.shared
                        .dataTaskPublisher(for: url)
                        .tryMap({ $0.data })
                        .decode(type: [Animal].self, decoder: JSONDecoder())
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { print($0) }, receiveValue: { self.data = $0 })
    }
}
