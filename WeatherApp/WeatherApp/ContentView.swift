//
//  ContentView.swift
//  WeatherApp
//
//  Created by itrainer006 on 01/10/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.data) { weather in
                    ZStack {
                        WeatherRowView(weather: weather)
                        NavigationLink(destination: WeatherDetailView(weather: weather)) {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationBarTitle("Weather")
        }
        .onAppear {
            self.viewModel.retrieveData()
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
