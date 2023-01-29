//
//  ContentView.swift
//  WordScramble
//
//  Created by Jens Nikolaus on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    var dogs = ["Sophie", "Stellah", "Meve", "Gus"]
    
    var body: some View {
        NavigationView {
            List {
                Section("Dogs") {
                    ForEach(dogs, id: \.self) {
                        Text($0)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("WordScramble")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
