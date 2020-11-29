//
//  SimpleAnimalRowView.swift
//  MyPetApp
//
//  Created by itrainer006 on 30/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SimpleAnimalRowView: View {
    var animal: Animal
    
    private var vaccinatedIcon: String {
        animal.vaccinated ? "checkmark.shield.fill" : "exclamationmark.shield.fill"
    }

    private var vaccinatedIconColor: Color {
        animal.vaccinated ? .green : .red
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 24) {
                WebImage(url: URL(string: animal.imageUrl))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.white)
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                VStack(alignment: .leading) {
                    Text(animal.name)
                        .font(.title)
                    
                    HStack(spacing: 16) {
                        Text(animal.animalType.rawValue.capitalized)
                            .font(.headline)
                        
                        Text(animal.years.description)
                            .font(.headline)
                        
                        Image(systemName: vaccinatedIcon)
                            .foregroundColor(vaccinatedIconColor)
                    }
                }
                Spacer()
            }
            Divider()
        }
    }
}

struct SimpleAnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SimpleAnimalRowView(animal: Animal(name: "Aladdin",
                                               imageUrl: "https://images.unsplash.com/photo-1507680225127-6450260913c0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b11b1a5ca779755f6c2670d089ef55&auto=format&fit=crop&w=2096&q=80",
                                               years: 1, vaccinated: true, animalType: .snake))
        }.padding()
    }
}
