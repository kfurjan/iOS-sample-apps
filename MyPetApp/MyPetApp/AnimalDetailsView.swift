//
//  AnimalDetailsView.swift
//  MyPetApp
//
//  Created by itrainer006 on 01/10/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { num in
                Image(systemName: num <= self.rating ? "star.fill" : "star")
                    .foregroundColor(num <= self.rating ? .yellow : .gray)
                    .onTapGesture {
                        self.rating = num
                }
            }
        }.padding()
    }
}

struct AnimalDetailsView: View {
    var animal: Animal
    
    @State private var rating = 4
    
    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: URL(string: animal.imageUrl))
                    .resizable()
                    .placeholder {
                        Rectangle().fill(Color.gray)
                    }
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.35)
                    .clipped()
                
                StarRatingView(rating: $rating)
                
                Spacer()
            }
        }
        .navigationBarTitle(animal.name)
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetailsView(animal: Animal(name: "Aladdin",
                                         imageUrl:      "https://images.unsplash.com/photo-1507680225127-6450260913c0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b11b1a5ca779755f6c2670d089ef55&auto=format&fit=crop&w=2096&q=80",
                                         years: 1, vaccinated: true, animalType: .snake))
    }
}
