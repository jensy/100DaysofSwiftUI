//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jens Nikolaus on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack() {
            Button("Show alert") {
                showingAlert = true
            }
            .alert("Important", isPresented: $showingAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) { }
            } message: {
                Text("Please read this text.")
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
