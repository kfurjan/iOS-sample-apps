//
//  ModernAnimalRowView.swift
//  MyPetApp
//
//  Created by itrainer006 on 29/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ModernAnimalRowView: View {
    var animal: Animal
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: animal.imageUrl))
                .resizable()
                .placeholder {
                    Rectangle().fill(Color.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                .clipped()
                .cornerRadius(18)
            
            HStack {
                Text(animal.name)
                .font(.headline)
                Spacer()
            }
        }
    }
}

struct ModernAnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ModernAnimalRowView(animal: Animal(name: "Aladdin",
                                               imageUrl: "https://images.unsplash.com/photo-1507680225127-6450260913c0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b11b1a5ca779755f6c2670d089ef55&auto=format&fit=crop&w=2096&q=80",
                                               years: 1, vaccinated: true, animalType: .snake))
        }.padding()
    }
}
