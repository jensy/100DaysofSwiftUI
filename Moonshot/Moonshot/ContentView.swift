//
//  ContentView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0..<100) { row in
                    NavigationLink {
                        Text("Detail \(row)")
                    } label: {
                        Text("Tap \(row)")
                    }
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
