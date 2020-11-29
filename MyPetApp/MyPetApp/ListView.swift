//
//  ListView.swift
//  MyPetApp
//
//  Created by itrainer006 on 29/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel = AnimalViewModel()
    @State private var isDetailed = false
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.data) { animal in
                    if self.isDetailed {
                        NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                            SimpleAnimalRowView(animal: animal)
                        }
                    } else {
                        ZStack {
                            ModernAnimalRowView(animal: animal)
                            NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { self.viewModel.retrieveData() }) {
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .padding(0.5)
                    }
                        .padding()
                        .background(
                            Circle()
                                .fill(Color.blue)
                                .shadow(radius: 6)
                        )
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Animals")
        .navigationBarItems(trailing: Button(action: { self.isDetailed.toggle() }) {
            Text("Toggle")
        })
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
            UITableView.appearance().backgroundColor = .clear
            self.viewModel.retrieveData()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
