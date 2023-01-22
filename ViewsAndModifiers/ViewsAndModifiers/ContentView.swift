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
        VStack {
            Button("Hello world") {
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
