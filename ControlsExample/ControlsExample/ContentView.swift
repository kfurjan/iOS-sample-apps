//
//  ContentView.swift
//  ControlsExample
//
//  Created by itrainer006 on 02/10/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["John", "Mary", "Jane", "Bob"]
    @State private var selectedName = "John"
    @State private var selectedDate = Date()
    @State private var sliderValue = 0.0
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Picker("Select a name", selection: $selectedName) {
                ForEach(names, id: \.self) { name in
                    HStack {
                        Image(systemName: "person.fill")
                        Text(name)
                    }
                }
            }.labelsHidden()
            
            Picker("Select a name", selection: $selectedName) {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text(selectedName)
            
            DatePicker(selection: $selectedDate, in: ...Date()) {
                Text("Select date")
            }.labelsHidden()
            
            Slider(value: $sliderValue, in: 0.0...1.0, step: 0.25)
                .accentColor(.red)
            Text(sliderValue.description)
            
            Toggle(isOn: $isOn) {
                Text("Toggle")
            }.labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
