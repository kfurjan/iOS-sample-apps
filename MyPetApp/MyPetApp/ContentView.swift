//
//  ContentView.swift
//  MyPetApp
//
//  Created by itrainer006 on 29/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                LoginView(isLoggedIn: $isLoggedIn)
                NavigationLink(destination: ListView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
