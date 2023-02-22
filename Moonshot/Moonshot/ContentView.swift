//
//  ContentView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    if showingGrid {
                        GridView()
                    } else if !showingGrid {
                        ListView()
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
