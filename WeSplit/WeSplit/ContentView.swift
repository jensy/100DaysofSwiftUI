//
//  ContentView.swift
//  WeSplit
//
//  Created by Jens Nikolaus on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    let dogs = ["Sophie", "Gus", "Meve"]
    @State private var selectedDog = "Sophie"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your dog", selection:
                        $selectedDog) {
                    ForEach(dogs, id: \.self) {
                        Text($0)
                    }
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
