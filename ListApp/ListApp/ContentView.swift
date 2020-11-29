//
//  ContentView.swift
//  ListApp
//
//  Created by itrainer006 on 25/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct Person: Identifiable, Hashable, Comparable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var iconName: String
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName < rhs.firstName;
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id;
    }
}

struct PersonRow: View {
    var person: Person
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: person.iconName)
                .resizable()
                .frame(width: 48, height: 64)
            
            VStack (alignment: .leading, spacing: 8) {
                Text(person.firstName)
                    .font(.largeTitle)
                Text(person.lastName)
                .font(.title)
            }
        }
    }
}

struct PersonDetail: View {
    var person: Person
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: person.iconName)
                .resizable()
                .frame(width: 64, height: 96)
                .rotationEffect(Angle(degrees: isAnimating ? 60 : 0))
                .foregroundColor(isAnimating ? Color.red : Color.black)
                .offset(y: isAnimating ? -100 : 0)
                .shadow(color: Color.black, radius: isAnimating ? 8 : 0, x: 0, y: 4)
                .scaleEffect(isAnimating ? 1.5 : 1)
                .animation(Animation.spring())
            
            Text(person.firstName)
                .font(.largeTitle)
            Text(person.lastName)
                .font(.largeTitle)
            
            Button(action: { self.isAnimating.toggle() }) {
                Text("Animate")
            }
        }
    }
}

struct ContentView: View {
    @State private var people = [
        Person(firstName: "John", lastName: "Doe", iconName: "person.fill"),
        Person(firstName: "Jane", lastName: "Doe", iconName: "person.fill"),
        Person(firstName: "Peter", lastName: "Pan", iconName: "person.fill"),
        Person(firstName: "Tim", lastName: "Cook", iconName: "person.fill"),
        Person(firstName: "Steve", lastName: "Jobs", iconName: "person.fill")
    ]
    
    func delete(offset: IndexSet) -> Void { people.remove(atOffsets: offset) }
    
    func move(offset: IndexSet, destination: Int) -> Void { people.move(fromOffsets: offset, toOffset: destination) }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("People"), footer: Text("Footer").font(.title)) {
                    ForEach(people) { person in
                        NavigationLink(destination: PersonDetail(person: person)) {
                            PersonRow(person: person)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("People")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            PersonDetail(person: Person(firstName: "Pero", lastName: "Peric", iconName: "person.fill"))
        }
    }
}
