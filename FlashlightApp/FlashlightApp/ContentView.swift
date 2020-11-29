//
//  ContentView.swift
//  FlashlightApp
//
//  Created by itrainer006 on 24/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(self.isOn ? Color.white : Color.black)
            
            Button(action: { self.isOn.toggle() }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray)
                        .shadow(radius: 8)
                    HStack {
                        Image(systemName: self.isOn ? "flashlight.on.fill" : "flashlight.off.fill")
                            .resizable()
                            .frame(width: 16, height: 36)
                        Text("Toggle light")
                    }.padding()
                }.fixedSize()
            }.foregroundColor(self.isOn ? Color.black : Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
