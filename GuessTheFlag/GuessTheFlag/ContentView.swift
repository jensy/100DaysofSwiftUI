//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jens Nikolaus on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("Hello, world!")
            Text("This is another text view")
            Spacer()
            Spacer()
            Text("Third")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
