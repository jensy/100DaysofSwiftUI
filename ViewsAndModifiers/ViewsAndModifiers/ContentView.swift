//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jens Nikolaus on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    // Creating views as properties
    @ViewBuilder var motto1: some View {
        HStack {
            Text("Draco dormiens")
            Text("Draco dormiens")
        }
    }
    
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack() {
            motto1
                .foregroundColor(.red)
            motto2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
