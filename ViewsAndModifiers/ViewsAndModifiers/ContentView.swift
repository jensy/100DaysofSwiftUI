//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jens Nikolaus on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Sophie")
                .font(.largeTitle)
            Text("Gus")
            Text("Meve")
            Text("Stellah")
        }
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
