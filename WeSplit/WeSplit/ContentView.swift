//
//  ContentView.swift
//  WeSplit
//
//  Created by Jens Nikolaus on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Hello, \(name)")
                }
                
                Section {
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
            }
            .navigationTitle("WeSplit")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
