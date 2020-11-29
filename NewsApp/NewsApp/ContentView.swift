//
//  ContentView.swift
//  NewsApp
//
//  Created by Kevin Furjan on 02/10/2020.
//  Copyright © 2020 kfurjan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ArticleViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        List {
            HStack {
                TextField("Enter search term", text: $searchTerm, onCommit: {
                    !self.searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        ? self.viewModel.getData(searchTerm: self.searchTerm)
                        : self.viewModel.getData(searchTerm: "world")
                })
                
                Button(action: {
                    !self.searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        ? self.viewModel.getData(searchTerm: self.searchTerm)
                        : self.viewModel.getData(searchTerm: "world")
                }) {
                    Text("Search")
                }
            }
            ForEach(viewModel.data) { article in
                Text(article.title)
            }
        }
        .onAppear {
            self.viewModel.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
